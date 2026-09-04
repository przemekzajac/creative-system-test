import Foundation

struct Stock: Identifiable, Hashable, Sendable {
    let ticker: String
    let name: String
    var currency: String = "USD"

    var id: String { ticker }

    /// Image set name inside `Assets.xcassets/Logos`. One circle-clipped PNG per ticker.
    var logoAssetName: String { ticker }
}

/// Hardcoded v1 watchlist. Kept alphabetical by ticker at runtime, so order here does not matter.
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
}
