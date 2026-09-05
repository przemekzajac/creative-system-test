import Foundation

/// What kind of thing a row is, which decides where its quote comes from and how the
/// change is labelled.
enum AssetKind: Sendable {
    /// US-listed stock or ETF, quoted by Finnhub. Change is measured from today's open.
    case stock
    /// Cryptocurrency, quoted by CoinGecko. Change is a rolling 24-hour figure.
    case crypto
}

struct Stock: Identifiable, Hashable, Sendable {
    let ticker: String
    let name: String
    var currency: String = "USD"
    var kind: AssetKind = .stock
    /// CoinGecko coin id for crypto rows, e.g. "ondo-finance". Unused for stocks.
    var coinID: String? = nil

    var id: String { ticker }

    /// Image set name inside `Assets.xcassets/Logos`. One circle-clipped PNG per row.
    var logoAssetName: String { ticker }

    static func crypto(_ ticker: String, _ name: String, coinID: String) -> Stock {
        Stock(ticker: ticker, name: name, currency: "USD", kind: .crypto, coinID: coinID)
    }
}

/// Hardcoded v1 watchlist: stocks first, alphabetical by ticker, then the coins in the
/// order they were chosen.
enum Watchlist {
    static let stocks: [Stock] = [
        Stock(ticker: "TSLA", name: "Tesla"),
        Stock(ticker: "BABA", name: "Alibaba Group"),
        Stock(ticker: "OSCR", name: "Oscar Health"),
        Stock(ticker: "ASML", name: "ASML Holding"),
        Stock(ticker: "ZETA", name: "Zeta Global"),
        Stock(ticker: "NVO", name: "Novo Nordisk"),
        Stock(ticker: "ASTS", name: "AST SpaceMobile"),
        Stock(ticker: "SHOP", name: "Shopify"),
        Stock(ticker: "HIMS", name: "Hims & Hers Health"),
        Stock(ticker: "SE", name: "Sea Limited"),
        Stock(ticker: "SPCX", name: "SpaceX"),
        Stock(ticker: "ADUR", name: "Aduro Clean Technologies"),
    ]
    .sorted { $0.ticker < $1.ticker }

    static let coins: [Stock] = [
        .crypto("ETH", "Ethereum", coinID: "ethereum"),
        .crypto("LIT", "Lighter", coinID: "lighter"),
        .crypto("MORPHO", "Morpho", coinID: "morpho"),
        .crypto("ONDO", "Ondo", coinID: "ondo-finance"),
        .crypto("CASHCAT", "Cash Cat", coinID: "cash-cat"),
    ]

    /// What the app shows, in page order.
    static let all: [Stock] = stocks + coins
}
