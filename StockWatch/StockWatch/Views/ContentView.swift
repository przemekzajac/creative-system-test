import SwiftUI

struct ContentView: View {
    @State private var store = QuoteStore()
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        Group {
            if store.hasAPIKey {
                watchlist
            } else {
                MissingAPIKeyView()
            }
        }
        .background(Theme.background.ignoresSafeArea())
        .onChange(of: scenePhase, initial: true) { _, phase in
            // Poll only while the app is on screen; stop as soon as the wrist drops.
            if phase == .active {
                store.startAutoRefresh()
            } else {
                store.stopAutoRefresh()
            }
        }
    }

    /// Vertical pager: the Digital Crown scrolls one stock per page, alphabetical by ticker.
    private var watchlist: some View {
        TabView {
            ForEach(store.stocks) { stock in
                StockCardView(
                    stock: stock,
                    quote: store.quotes[stock.ticker],
                    error: store.errors[stock.ticker],
                    session: store.marketSession,
                    lastUpdated: store.lastUpdated
                )
            }
        }
        .tabViewStyle(.verticalPage)
    }
}

private struct MissingAPIKeyView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("No API key")
                .font(.app(20, weight: .bold))
            Text("Paste your free Finnhub key into Secrets.swift, then press Run again.")
                .font(.app(13, weight: .medium))
                .foregroundStyle(Theme.secondaryText)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
