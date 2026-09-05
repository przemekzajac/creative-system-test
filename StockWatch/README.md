# StockWatch — Apple Watch day-return ticker

Standalone watchOS app (no iPhone app needed). One page per stock; turn the Digital Crown to
scroll through them, alphabetical by ticker.

```
┌────────────────────────┐
│ (logo) TSLA            │   ← line 1: logo + ticker
│ 248.12 USD             │   ← line 2: last price + currency
│ +3.56%                 │   ← line 3: today's return, big, green / red / white
│      LIVE · 10:09      │   ← session + last refresh
└────────────────────────┘
```

Style follows Apple's *Activity Digital* watch face: black background, SF Pro, bold
numerals in the Activity ring colors (green `#92E82A` up, red `#FA114F` down, white flat).

## Data

- **Stocks:** [Finnhub](https://finnhub.io) free tier. Real-time US quotes (IEX-sourced),
  60 REST calls/min, personal non-commercial use.
- **Crypto:** [CoinGecko](https://www.coingecko.com/en/api) public API, no key required.
  One `/simple/price` call covers every coin, and its change is a rolling **24-hour**
  figure rather than a session return, so those cards are labelled `24H`. An optional free
  demo key in `Secrets.swift` raises the shared anonymous rate limit.
- **Return** = Finnhub's `dp` field = (last price − previous close) / previous close.
  Rounded to 0.01%; the color is decided on the rounded value, so `+0.00%` is white.
- **Cadence:** every 30 s while the app is on screen during the regular session, 60 s otherwise.
  12 tickers + 1 market-status call = 26 calls/min, under the limit. Polling stops when the app
  leaves the foreground: watchOS budgets background refreshes to a few per hour, so true
  1-minute freshness is only possible while you are looking at the watch.
- **Market status** comes from Finnhub (`LIVE`, `PRE-MARKET`, `AFTER HOURS`, `MARKET CLOSED`),
  with a local Mon–Fri 09:30–16:00 ET fallback if that call fails.

## Setup (needs a Mac with Xcode 15+)

Never used Xcode? Read [GETTING-STARTED.md](GETTING-STARTED.md) instead; it covers every step
from installing Xcode to the App Store.

1. Get a free API key at <https://finnhub.io/register> and paste it into
   `StockWatch/Secrets.swift` (replace `YOUR_FINNHUB_API_KEY`).
2. Open `StockWatch.xcodeproj`. (It is committed; `project.yml` can regenerate it with
   `xcodegen generate` if you ever restructure the sources.)
3. In Xcode select the target → *Signing & Capabilities* → pick your Team. A free Apple ID
   works for installing on your own watch (the install expires after 7 days; a paid developer
   account extends that to a year).
4. Run on the simulator (e.g. *Apple Watch Series 10 45mm*) or on your paired watch.

## Adding a stock or coin

1. Add a `Stock(ticker:name:)` line to `Watchlist.stocks`, or a
   `.crypto("TICKER", "Name", coinID: "coingecko-id")` line to `Watchlist.coins`, in
   `StockWatch/Models/Stock.swift`. Stocks sort alphabetically; coins keep their listed order.
2. Add a circle-clipped 200×200 PNG as `Assets.xcassets/Logos/<TICKER>.imageset/<TICKER>.png`
   with the same `Contents.json` as the existing ones. Logos in this repo came from
   `assets.parqet.com/logos/symbol/<TICKER>` and `financialmodelingprep.com/image-stock/<TICKER>.png`.

## Layout of the code

| File | Role |
| --- | --- |
| `Models/Stock.swift` | `Stock` + the hardcoded `Watchlist` |
| `Models/Quote.swift` | `Quote` + price/return formatting rules |
| `Services/FinnhubClient.swift` | `/quote` and `/stock/market-status` calls |
| `Services/CoinGeckoClient.swift` | `/simple/price` call for all coins at once |
| `Services/MarketClock.swift` | Local market-hours fallback |
| `Store/QuoteStore.swift` | Observable state + foreground refresh loop |
| `Views/ContentView.swift` | Vertical crown-driven pager |
| `Views/StockCardView.swift` | The three-line stock card |
| `Views/Theme.swift` | Colors and font helper |

## Roadmap

- [ ] Complication / widget showing one favourite ticker
- [ ] Watchlist editing (iPhone companion or on-watch list)
- [ ] Background refresh so the first frame after raising the wrist is not stale

App icon: Noto Emoji rabbit face (Apache 2.0, github.com/googlefonts/noto-emoji) on black.
