import SwiftUI

/// One page of the watchlist:
///   logo + ticker
///   price + currency
///   big colored day return
///   session / updated footer
/// Left-aligned, vertically centered on the screen.
struct StockCardView: View {
    let stock: Stock
    let quote: Quote?
    let error: String?
    let session: QuoteStore.MarketSession
    let lastUpdated: Date?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Spacer(minLength: 0)
            header
            priceLine
            returnLine
            footer
                .padding(.top, 6)
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding(.horizontal, 8)
        .padding(.bottom, 4)
        .background(Theme.background)
    }

    private var header: some View {
        HStack(spacing: 8) {
            Image(stock.logoAssetName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .accessibilityHidden(true)
            Text(stock.ticker)
                .font(.app(24, weight: .bold))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .accessibilityLabel(stock.name)
    }

    private var priceLine: some View {
        HStack(alignment: .firstTextBaseline, spacing: 5) {
            Text(quote?.formattedPrice ?? "—")
                .font(.app(22, weight: .semibold))
                .foregroundStyle(.white)
                .monospacedDigit()
            Text(stock.currency)
                .font(.app(14, weight: .semibold))
                .foregroundStyle(Theme.secondaryText)
        }
        .lineLimit(1)
        .minimumScaleFactor(0.7)
    }

    private var returnLine: some View {
        Text(quote?.formattedChangePercent ?? "—.——%")
            .font(.app(52, weight: .bold))
            .foregroundStyle(Theme.returnColor(for: quote))
            .monospacedDigit()
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .padding(.top, 2)
            .accessibilityLabel(accessibilityReturnText)
    }

    private var footer: some View {
        Text(footerText)
            .font(.app(12, weight: .semibold))
            .foregroundStyle(error == nil ? Color.white : Theme.negative)
            .textCase(.uppercase)
            .lineLimit(1)
            .minimumScaleFactor(0.8)
            .frame(maxWidth: .infinity, alignment: .center)
    }

    private var footerText: String {
        if let error { return error }
        guard let lastUpdated else { return "Loading…" }
        let time = lastUpdated.formatted(date: .omitted, time: .shortened)
        return "\(session.label) · \(time)"
    }

    private var accessibilityReturnText: String {
        guard let quote else { return "No data yet" }
        return "Today \(quote.formattedChangePercent)"
    }
}

#Preview("Up") {
    StockCardView(
        stock: Stock(ticker: "TSLA", name: "Tesla"),
        quote: Quote(price: 248.12, previousClose: 239.58, changePercent: 3.564, lastTradeAt: .now),
        error: nil,
        session: .regular,
        lastUpdated: .now
    )
}

#Preview("Down") {
    StockCardView(
        stock: Stock(ticker: "NVO", name: "Novo Nordisk"),
        quote: Quote(price: 91.04, previousClose: 103.9, changePercent: -12.374, lastTradeAt: .now),
        error: nil,
        session: .postMarket,
        lastUpdated: .now
    )
}

#Preview("Flat / loading") {
    StockCardView(
        stock: Stock(ticker: "SE", name: "Sea Limited"),
        quote: nil,
        error: nil,
        session: .closed,
        lastUpdated: nil
    )
}
