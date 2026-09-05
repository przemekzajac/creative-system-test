import Foundation

struct Quote: Equatable, Sendable {
    /// Last traded price.
    let price: Double
    /// Previous regular-session close.
    let previousClose: Double
    /// Today's return in percent, e.g. 3.56 for +3.56%.
    let changePercent: Double
    /// Timestamp of the last trade that produced `price`.
    let lastTradeAt: Date

    /// `changePercent` rounded to the 2 decimals we display, so color and text always agree.
    var displayedChangePercent: Double {
        (changePercent * 100).rounded() / 100
    }

    /// "+3.56%", "-0.42%", or "0.00%" (no sign when flat).
    var formattedChangePercent: String {
        let value = displayedChangePercent
        if value == 0 { return "0.00%" }
        return String(format: "%+.2f%%", value)
    }

    /// "2,457.64", "0.3696", "0.000042" — more decimals as the price gets smaller, so
    /// sub-dollar coins do not all render as "0.00".
    var formattedPrice: String {
        let magnitude = abs(price)
        let decimals: Int
        switch magnitude {
        case 1...: decimals = 2
        case 0.01..<1: decimals = 4
        default: decimals = 6
        }
        return price.formatted(.number.precision(.fractionLength(decimals)))
    }
}
