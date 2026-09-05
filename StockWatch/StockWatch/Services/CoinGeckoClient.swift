import Foundation

/// Crypto prices from CoinGecko's public API (https://www.coingecko.com/en/api).
///
/// One request covers the whole coin list, so a refresh costs a single call no matter how
/// many coins are on the watchlist. Works with no API key; a free demo key raises the
/// shared anonymous rate limit and is picked up from `Secrets` when present.
struct CoinGeckoClient: Sendable {
    enum ClientError: LocalizedError {
        case badStatus(Int)

        var errorDescription: String? {
            switch self {
            case .badStatus(429): return "Rate limited"
            case .badStatus(let code): return "HTTP \(code)"
            }
        }
    }

    var demoAPIKey: String = ""
    var urlSession: URLSession = .shared

    private static let baseURL = URL(string: "https://api.coingecko.com/api/v3")!

    /// GET /simple/price — current price and 24-hour change for every requested coin.
    /// Returns quotes keyed by CoinGecko coin id; ids the service does not know are absent.
    func quotes(for coinIDs: [String]) async throws -> [String: Quote] {
        guard !coinIDs.isEmpty else { return [:] }

        struct Entry: Decodable {
            let usd: Double
            let usd24hChange: Double?

            enum CodingKeys: String, CodingKey {
                case usd
                case usd24hChange = "usd_24h_change"
            }
        }

        var components = URLComponents(
            url: Self.baseURL.appendingPathComponent("simple/price"),
            resolvingAgainstBaseURL: false
        )!
        components.queryItems = [
            URLQueryItem(name: "ids", value: coinIDs.joined(separator: ",")),
            URLQueryItem(name: "vs_currencies", value: "usd"),
            URLQueryItem(name: "include_24hr_change", value: "true"),
        ]

        var request = URLRequest(url: components.url!)
        request.timeoutInterval = 15
        let key = demoAPIKey.trimmingCharacters(in: .whitespacesAndNewlines)
        if !key.isEmpty {
            request.setValue(key, forHTTPHeaderField: "x-cg-demo-api-key")
        }

        let (data, response) = try await urlSession.data(for: request)
        if let http = response as? HTTPURLResponse, !(200..<300).contains(http.statusCode) {
            throw ClientError.badStatus(http.statusCode)
        }

        let decoded = try JSONDecoder().decode([String: Entry].self, from: data)
        let now = Date()
        return decoded.reduce(into: [:]) { result, pair in
            let change = pair.value.usd24hChange ?? 0
            // Back out the reference price the 24-hour change was measured against, so the
            // Quote carries the same fields as a stock quote.
            let previous = change == -100 ? pair.value.usd : pair.value.usd / (1 + change / 100)
            result[pair.key] = Quote(
                price: pair.value.usd,
                previousClose: previous,
                changePercent: change,
                lastTradeAt: now
            )
        }
    }
}
