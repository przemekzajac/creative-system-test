import Foundation

enum Secrets {

    // ─────────────────────────────────────────────────────────────────────
    //  PASTE YOUR FINNHUB API KEY BETWEEN THE QUOTES ON THE LINE BELOW.
    //  Get one free at https://finnhub.io/register
    // ─────────────────────────────────────────────────────────────────────

    static let finnhubAPIKey = ""

    // ─────────────────────────────────────────────────────────────────────
    //  Nothing below this line needs editing.
    // ─────────────────────────────────────────────────────────────────────

    /// The key with any accidentally pasted spaces or newlines removed.
    static var trimmedAPIKey: String {
        finnhubAPIKey.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
