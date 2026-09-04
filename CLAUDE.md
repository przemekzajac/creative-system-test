# Project Memory

## Colors

### BACKGROUNDS

The two light background colors for this project. Refer to them as `BACKGROUNDS`.

| Name      | Hex       | Notes                                                                       |
| --------- | --------- | --------------------------------------------------------------------------- |
| Ice Blue  | `#A8C7E7` | Soft desaturated cornflower. Cool and airy; pairs with warm greys, off-white. |
| Sea Glass | `#A8D5C4` | Muted mint with a grey undertone. Pairs with sand, terracotta, deep navy.     |

Matched lightness (~L 82) and saturation, so they read as an intentional pair.

## Copy

### TEXTS

The two headline texts for this project. Refer to them as `TEXTS`.

1. No job. 2 incomes. No problem.
2. Treat or supplement? Both.

## Images

### DOGS

The two dog cutouts for this project. Refer to them as `DOGS`.

| Key    | Subject                                                                 | File                             |
| ------ | ----------------------------------------------------------------------- | -------------------------------- |
| DOG 1  | Black French Bulldog, seated, full body, looking up, tongue out          | `assets/dogs/dog-1-frenchie.png` |
| DOG 2  | Brown/tan Chihuahua, head-and-chest crop, ears up, tongue out to the side | `assets/dogs/dog-2-chihuahua.png` |

Both are to be used as **transparent-background PNG cutouts** (originals came on
white). Intended to sit on `BACKGROUNDS`.

**Hard constraint:** no white anywhere in a final asset. The white studio
backdrop must be fully keyed out — no white box, no white halo or fringe around
the fur and ears. The dog sits directly on the `BACKGROUNDS` color.

> Asset files pending — source images were pasted into chat and not available on disk.

## Deliverables

### Meta ads — 8 variations (3:4)

Built with Nano Banana 2 Lite I2I (modelId `2453`, group `414`), settings
`aspect_ratio: 3:4`, `quality: 1k`. Output is 896×1200 px.

Layout, all centered, top to bottom: TEXT headline → DOG cutout →
`PAWS & CHEW` → `Yummie gummies`.

| # | DOG | TEXT | BACKGROUND | File |
| - | --- | ---- | ---------- | ---- |
| 1 | Frenchie | No job. 2 incomes. No problem. | Ice Blue | `assets/ads/01-frenchie-nojob-iceblue.png` |
| 2 | Frenchie | No job. 2 incomes. No problem. | Sea Glass | `assets/ads/02-frenchie-nojob-seaglass.png` |
| 3 | Frenchie | Treat or supplement? Both. | Ice Blue | `assets/ads/03-frenchie-treat-iceblue.png` |
| 4 | Frenchie | Treat or supplement? Both. | Sea Glass | `assets/ads/04-frenchie-treat-seaglass.png` |
| 5 | Chihuahua | No job. 2 incomes. No problem. | Ice Blue | `assets/ads/05-chihuahua-nojob-iceblue.png` |
| 6 | Chihuahua | No job. 2 incomes. No problem. | Sea Glass | `assets/ads/06-chihuahua-nojob-seaglass.png` |
| 7 | Chihuahua | Treat or supplement? Both. | Ice Blue | `assets/ads/07-chihuahua-treat-iceblue.png` |
| 8 | Chihuahua | Treat or supplement? Both. | Sea Glass | `assets/ads/08-chihuahua-treat-seaglass.png` |

Verified: 0% near-white pixels in every file — the white backdrop is fully keyed out.

## StockWatch app

Standalone watchOS app in `StockWatch/` (XcodeGen `project.yml`, SwiftUI, watchOS 10+).
Shows today's % return per ticker, one crown-scrolled page per stock, alphabetical.
Data: Finnhub free tier (`/quote`, `/stock/market-status`), key lives in
`StockWatch/StockWatch/Secrets.swift`. Style: Activity Digital face (black, SF Pro bold,
green `#92E82A` / red `#FA114F` / white). Hardcoded watchlist and logo image sets in
`Models/Stock.swift` and `Assets.xcassets/Logos/`. See `StockWatch/README.md`.
