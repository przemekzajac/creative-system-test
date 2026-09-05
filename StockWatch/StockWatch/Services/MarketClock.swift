import Foundation

/// Local fallback for market hours when the market-status call fails.
/// Regular NYSE/NASDAQ session: Mon–Fri 09:30–16:00 America/New_York. Ignores exchange holidays.
enum MarketClock {
    static let newYork = TimeZone(identifier: "America/New_York")!

    static func isRegularSessionOpen(at date: Date = Date()) -> Bool {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = newYork
        let parts = calendar.dateComponents([.weekday, .hour, .minute], from: date)
        guard
            let weekday = parts.weekday, (2...6).contains(weekday), // Monday...Friday
            let hour = parts.hour, let minute = parts.minute
        else { return false }
        let minutesSinceMidnight = hour * 60 + minute
        return minutesSinceMidnight >= 9 * 60 + 30 && minutesSinceMidnight < 16 * 60
    }
}
