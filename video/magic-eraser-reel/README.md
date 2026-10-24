# Canva Magic Eraser — Meta Reels video ad

18-second vertical (9:16) video ad for Canva's **Magic Eraser** feature, generated with
**Seedance 2.5 on Artlist**. The copy-paste prompt and Artlist settings are in
[`seedance-prompt.md`](seedance-prompt.md). Reference images are in [`references/`](references/).

| File | Purpose |
| --- | --- |
| `seedance-prompt.md` | The prompt to paste into Artlist + settings + fix-it table |
| `references/soap-hero.png` | Hero product photo ("safa" organic soap bar). Upload as `@Image 1`. 684×866 px |
| `references/storyboard.png` | The original 4-beat storyboard this scenario follows |

## Scenario

Structure: problem → action → payoff → outcome (hook, demo, proof, CTA). Total 18 s, 24 fps, 9:16.
All on-screen text sits in the upper-middle of the frame, inside Meta's safe zone.

| Beat | Time | Visual | On-screen text | Audio |
| --- | --- | --- | --- | --- |
| 1 · The problem | 0–3 s | Slow push-in on the perfect soap still life. At ~1.5 s a hand/finger intrudes at the bottom-right edge, slightly blurred. Zoom-punch + thin red circle around the finger. | "This photo was perfect… until I noticed THAT." | Upbeat acoustic-pop track starts; "uh-oh" blip / record scratch |
| 2 · The action | 3–7 s | Canva editor on a laptop screen: white UI, "Edit image" panel, **Magic Eraser** tile selected (purple), Brush mode, size slider. Cursor paints a translucent purple highlight over the finger, clicks the purple **Erase** button; sparkle processing. | "Reshoot it? Nope." | UI click, brush swish, shimmer |
| 3 · The payoff | 7–13 s | Finger dissolves, stone and linen fill in seamlessly. Full-frame before/after wipe left→right ("Before" / "After" pills). Slow push-in on the clean photo. | "Just erase it." | Whoosh on erase, success chime |
| 4 · The outcome | 13–18 s | The clean photo becomes a finished product post with the "safa — ORGANIC SOAP BAR" wordmark. End card: Canva gradient "c" logo, "Canva", purple CTA pill. | "Post-ready. No reshoot required." → CTA "Clean up your photo in Canva" | Music resolves, final chime |

### Why it is built this way

- **Hook by second 1–2.** A visible mistake plus a bold line; by 3 s the viewer knows what the ad is about.
  Meta's hook rate (3-second views / impressions) is the first metric to optimise.
- **Sound-off first.** Most Reels/Feed video is watched muted; every beat carries its message in text.
  Audio only reinforces. Facebook Reels does not auto-caption ads, so text is burned in.
- **Native 9:16, single subject, high contrast.** Fills the Reels/Stories screen; no letterboxing.
- **Problem → demo → proof → CTA** is the standard high-converting structure for software feature ads.
  The before/after wipe is the "proof" moment; the CTA is repeated as a button in the end card.
- **Brand-consistent.** Canva's white editor, purple/teal accents, Canva-Sans-style typography, upbeat and
  friendly tone ("Reshoot it? Nope.").

## Meta specs (Reels / Stories)

| Item | Value |
| --- | --- |
| Aspect ratio | 9:16 |
| Resolution | 1080×1920 px minimum (1440×2560 preferred). Seedance renders 1080p; upscale only if needed |
| Length | 18 s (sweet spot 15–30 s; optional 15 s trim keeps Facebook Stories on one card) |
| Container / codec | MP4 (or MOV), H.264, square pixels, fixed frame rate, progressive scan |
| Audio | Stereo AAC, 128 kbps or higher |
| File size | Up to 4 GB |
| Captions | Burned into the video (no auto-captions on Facebook Reels ads) |
| Primary text | Keep the point in the first 125 characters; Reels shows ~40 |
| Headline | Under 40 characters |

### Safe zones (keep text and logos out)

| Zone | Share of frame | On 1080×1920 |
| --- | --- | --- |
| Top (profile, audio label) | 14 % | 269 px |
| Bottom (caption, CTA, buttons) | 35 % | 672 px |
| Each side (icons on the right) | 6 % | 65 px |
| Resulting safe area | — | ≈ 950×979 px, upper-middle |

Footage may fill the whole frame; only text and logos must stay inside the safe area. Ads Manager's
preview highlights covered areas in yellow — check it before publishing. Feed placements will crop 9:16 to
4:5; the key action is centred, so the crop is safe.

### Suggested ad copy

- Primary text: "Stray hand in your product shot? Erase it in seconds with Magic Eraser."
- Headline: "Clean up your photo in Canva"
- CTA button: "Learn more" / "Try now"

## Canva brand and Magic Eraser UX notes used in the prompt

- Colours: Canva purple `#7D2AE7` (logo) / `#8B3DFF` (buttons), Canva teal `#00C4CC`, deep violet `#4A1A96`, white UI.
- Logo: rounded lowercase "c" with a purple→teal gradient, paired with the "Canva" wordmark.
- Type: Canva Sans / Canva Sans Display (clean geometric sans). Not available to Seedance, so the prompt
  asks for "clean geometric sans-serif like Canva Sans".
- Magic Eraser flow (Canva help): select the photo → **Edit** on the editor toolbar → under **Tools** pick
  **Magic Eraser** → **Brush** (size slider) or **Click** mode → paint over the object → **Erase** → wait for
  processing. Also offers **Foreground**, **Text**, **Deselect** and press-and-hold **Compare**.
  Magic Eraser is a Pro/Business/Enterprise/Education/Nonprofit feature.
- Canva's brand page states commercial use of the Canva logo generally requires written permission from
  Canva. Fine for an internal/test creative; obtain permission before a real paid campaign.

## How to generate (Artlist web app)

1. Artlist → AI Video → model **Seedance 2.5** (Standard).
2. Upload `references/soap-hero.png` as the only image reference (`@Image 1`).
3. Aspect ratio **9:16**, duration **fixed 18 s** (not Smart Duration), audio **on**.
4. Paste the block from `seedance-prompt.md`.
5. **Draft Mode (480p)**: run 2–3 drafts. Check in this order: all text spelled correctly and in the
   upper-middle; the finger really disappears with clean fill; the editor reads as Canva (white, purple
   tile + Erase button); 18 s long; no voice/lyrics.
6. Fix issues with the table at the bottom of `seedance-prompt.md` (use time-scoped edits such as
   "0:03–0:07" to redo only the editor beat).
7. Render the approved draft at **1080p** and export MP4 (H.264, AAC).
8. Optional post: trim to 15 s for a Stories variant; export a 4:5 centre crop for Feed-only use.

## Sources

- Meta specs and safe zones: [Biddyco — Meta ad specs 2026](https://www.biddyco.com/blog-posts/meta-ad-specs),
  [AdsUploader — safe zones](https://adsuploader.com/blog/meta-ads-safe-zones),
  [Benly — Meta video ads guide](https://benly.ai/learn/meta-ads/video-ads-guide)
- Creative best practice: [Benly — creative best practices 2026](https://benly.ai/learn/meta-ads/creative-best-practices),
  [Stackmatix — Meta video ads playbook](https://www.stackmatix.com/blog/meta-video-ads),
  [Coinis — first 3 seconds](https://coinis.com/how-to/first-3-seconds-facebook-video-ad)
- Seedance 2.5 on Artlist: [Artlist model page](https://artlist.io/ai/models/seedance-2-5),
  [Artlist blog — Seedance 2.0](https://artlist.io/blog/new-seedance-2/)
- Seedance prompting: [Kylon — Seedance 2.5 prompt guide](https://kylon.io/blog/seedance-2-5-prompt-guide-2026),
  [Atlas Cloud — how to write Seedance 2.5 prompts](https://www.atlascloud.ai/blog/tips/how-to-write-seedance-2.5-prompts)
- Canva Magic Eraser: [Canva Help Center](https://www.canva.cn/en/help/magic-eraser-cn/),
  [Lilach Bullock — how to use Magic Eraser](https://www.lilachbullock.com/how-to-use-magic-eraser-in-canva/)
- Canva brand: [brandkit.pro — Canva](https://brandkit.pro/brand/canva),
  [Canva developer typography](https://canva.dev/docs/apps/design-guidelines/typography)
