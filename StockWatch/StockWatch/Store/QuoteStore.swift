import Foundation
import Observation

/// Owns the watchlist quotes and the foreground refresh loop.
///
/// Refresh budget: (watchlist size + 1) calls per refresh. With 12 tickers at a 30 s cadence
/// that is 26 calls/min, inside Finnhub's free-tier limit of 60/min.
@MainActor
@Observable
final class QuoteStore {
    enum MarketSession: Equatable {
        case regular
        case preMarket
        case postMarket
        case closed

        var label: String {
            switch self {
            case .regular: return "LIVE"
            case .preMarket: return "PRE-MARKET"
            case .postMarket: return "AFTER HOURS"
            case .closed: return "MARKET CLOSED"
            }
        }
    }

    let stocks: [Stock]

    private(set) var quotes: [String: Quote] = [:]
    private(set) var errors: [String: String] = [:]
    private(set) var marketSession: MarketSession = .closed
    private(set) var lastUpdated: Date?
    private(set) var isRefreshing = false

    private let client: FinnhubClient
    private let regularInterval: TimeInterval
    private let offHoursInterval: TimeInterval
    private var loopTask: Task<Void, Never>?

    init(
        stocks: [Stock] = Watchlist.stocks,
        client: FinnhubClient = FinnhubClient(apiKey: Secrets.finnhubAPIKey),
        regularInterval: TimeInterval = 30,
        offHoursInterval: TimeInterval = 60
    ) {
        self.stocks = stocks
        self.client = client
        self.regularInterval = regularInterval
        self.offHoursInterval = offHoursInterval
    }

    var hasAPIKey: Bool { client.hasAPIKey }

    // MARK: - Refresh loop

    /// Starts polling. Call when the app becomes active; polling only makes sense while the
    /// screen is on, watchOS does not let us poll every 30 s in the background.
    func startAutoRefresh() {
        guard loopTask == nil else { return }
        loopTask = Task { [weak self] in
            while !Task.isCancelled {
                guard let self else { return }
                await self.refresh()
                let interval = self.marketSession == .regular ? self.regularInterval : self.offHoursInterval
                try? await Task.sleep(for: .seconds(interval))
            }
        }
    }

    func stopAutoRefresh() {
        loopTask?.cancel()
        loopTask = nil
    }

    /// One full refresh: market status + every quote, fetched concurrently.
    func refresh() async {
        guard hasAPIKey, !isRefreshing else { return }
        isRefreshing = true
        defer { isRefreshing = false }

        async let statusTask = fetchMarketSession()

        let results = await withTaskGroup(of: (String, Result<Quote, Error>).self) { group in
            for stock in stocks {
                group.addTask { [client] in
                    do {
                        return (stock.ticker, .success(try await client.quote(for: stock.ticker)))
                    } catch {
                        return (stock.ticker, .failure(error))
                    }
                }
            }
            var collected: [(String, Result<Quote, Error>)] = []
            for await result in group { collected.append(result) }
            return collected
        }

        marketSession = await statusTask

        var anySuccess = false
        for (ticker, result) in results {
            switch result {
            case .success(let quote):
                quotes[ticker] = quote
                errors[ticker] = nil
                anySuccess = true
            case .failure(let error):
                // Keep the last good quote on screen; only surface the error text.
                errors[ticker] = error.localizedDescription
            }
        }
        if anySuccess { lastUpdated = Date() }
    }

    private func fetchMarketSession() async -> MarketSession {
        if let status = try? await client.usMarketStatus() {
            switch status.session {
            case .regular: return .regular
            case .preMarket: return .preMarket
            case .postMarket: return .postMarket
            case nil: return status.isOpen ? .regular : .closed
            }
        }
        return MarketClock.isRegularSessionOpen() ? .regular : .closed
    }
}
