import Foundation

enum Secrets {

    // ─────────────────────────────────────────────────────────────────────
    //  PASTE YOUR FINNHUB API KEY BETWEEN THE QUOTES ON THE LINE BELOW.
    //  Get one free at https://finnhub.io/register
    // ─────────────────────────────────────────────────────────────────────

    static let finnhubAPIKey = ""

    //  Crypto prices need no key. If CoinGecko ever answers "Rate limited",
    //  get a free demo key at https://www.coingecko.com/en/developers/dashboard
    //  and paste it between these quotes.

    static let coinGeckoDemoKey = ""

    // ─────────────────────────────────────────────────────────────────────
    //  Nothing below this line needs editing.
    // ─────────────────────────────────────────────────────────────────────

    /// The key with any accidentally pasted spaces or newlines removed.
    static var trimmedAPIKey: String {
        finnhubAPIKey.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
