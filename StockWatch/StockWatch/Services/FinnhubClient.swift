import Foundation

/// Thin async wrapper around the Finnhub REST API (https://finnhub.io/docs/api).
struct FinnhubClient: Sendable {
    enum ClientError: LocalizedError {
        case missingAPIKey
        case badStatus(Int)
        case unknownSymbol(String)

        var errorDescription: String? {
            switch self {
            case .missingAPIKey: return "Missing Finnhub API key"
            case .badStatus(429): return "Rate limited"
            case .badStatus(let code): return "HTTP \(code)"
            case .unknownSymbol(let symbol): return "No data for \(symbol)"
            }
        }
    }

    enum Session: String, Decodable, Sendable {
        case preMarket = "pre-market"
        case regular
        case postMarket = "post-market"
    }

    struct MarketStatus: Decodable, Sendable {
        let isOpen: Bool
        let session: Session?
    }

    let apiKey: String
    var urlSession: URLSession = .shared

    private static let baseURL = URL(string: "https://finnhub.io/api/v1")!

    /// False while the key is still blank or is one of the placeholder strings
    /// earlier versions of this file shipped with.
    var hasAPIKey: Bool {
        let key = apiKey.trimmingCharacters(in: .whitespacesAndNewlines)
        return !key.isEmpty && !key.hasPrefix("YOUR_") && !key.hasPrefix("PASTE_")
    }

    /// GET /quote — current price, previous close and day change for one symbol.
    func quote(for symbol: String) async throws -> Quote {
        struct Response: Decodable {
            let c: Double   // current price
            let dp: Double? // percent change vs previous close
            let pc: Double  // previous close
            let t: Double   // unix timestamp of last trade
        }
        let r: Response = try await get("quote", query: ["symbol": symbol])
        guard r.c > 0 else { throw ClientError.unknownSymbol(symbol) }
        let percent = r.dp ?? (r.pc > 0 ? (r.c - r.pc) / r.pc * 100 : 0)
        return Quote(
            price: r.c,
            previousClose: r.pc,
            changePercent: percent,
            lastTradeAt: Date(timeIntervalSince1970: r.t)
        )
    }

    /// GET /stock/market-status — whether US exchanges are open, and which session we are in.
    func usMarketStatus() async throws -> MarketStatus {
        try await get("stock/market-status", query: ["exchange": "US"])
    }

    private func get<T: Decodable>(_ path: String, query: [String: String]) async throws -> T {
        guard hasAPIKey else { throw ClientError.missingAPIKey }

        var components = URLComponents(
            url: Self.baseURL.appendingPathComponent(path),
            resolvingAgainstBaseURL: false
        )!
        components.queryItems = query
            .sorted { $0.key < $1.key }
            .map { URLQueryItem(name: $0.key, value: $0.value) }

        var request = URLRequest(url: components.url!)
        request.timeoutInterval = 15
        request.setValue(apiKey, forHTTPHeaderField: "X-Finnhub-Token")

        let (data, response) = try await urlSession.data(for: request)
        if let http = response as? HTTPURLResponse, !(200..<300).contains(http.statusCode) {
            throw ClientError.badStatus(http.statusCode)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
