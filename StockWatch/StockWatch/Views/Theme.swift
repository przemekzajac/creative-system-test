import SwiftUI

/// Visual language borrowed from Apple's "Activity Digital" watch face:
/// black background, bold SF Pro numerals in the Activity ring colors.
enum Theme {
    static let background = Color.black
    /// Activity "Exercise" ring green.
    static let positive = Color(red: 0.573, green: 0.910, blue: 0.165)
    /// Activity "Move" ring red.
    static let negative = Color(red: 0.980, green: 0.067, blue: 0.310)
    static let neutral = Color.white
    static let secondaryText = Color.white.opacity(0.6)

    /// Green above zero, red below, white when the displayed value is exactly 0.00%.
    static func returnColor(for quote: Quote?) -> Color {
        guard let quote, quote.changePercent.isFinite else { return neutral }
        let value = quote.displayedChangePercent
        if value > 0 { return positive }
        if value < 0 { return negative }
        return neutral
    }
}

extension Font {
    /// SF Pro at the given size and weight. watchOS substitutes SF Compact automatically,
    /// the same face the built-in watch faces and Stocks complications use.
    static func app(_ size: CGFloat, weight: Font.Weight) -> Font {
        .system(size: size, weight: weight, design: .default)
    }
}
