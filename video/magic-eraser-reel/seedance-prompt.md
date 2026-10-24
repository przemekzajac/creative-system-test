# Seedance 2.5 prompt — Canva Magic Eraser Reel (18 s, 9:16)

Copy the block under **Prompt** into Artlist → AI Video → Seedance 2.5.
Upload `references/soap-hero.png` as the first (and only) image reference so it is `@Image 1`.

## Artlist settings

| Setting | Value |
| --- | --- |
| Model | Seedance 2.5 (Standard, not Fast) |
| Mode | Image to video / references (1 image) |
| Aspect ratio | 9:16 |
| Duration | Fixed, 18 s (do **not** use Smart Duration — it cuts at 4–15 s) |
| Frame rate | 24 fps (model default) |
| Resolution | Draft Mode 480p for 2–3 iterations → final render 1080p |
| Audio | On (generated in the same pass) |

## Prompt

```text
[References]
@Image 1 defines the hero product scene for the whole video: a rectangular cream-white organic soap bar standing upright on a rough oval travertine stone slab, a speckled beige ceramic vase with dried white baby's-breath flowers on the left, a green olive branch entering from the top right, a folded cream linen cloth in the lower left, warm sand-coloured wall with soft morning light and gentle leaf shadows. Use its lighting, colours, materials and composition. Do not use the "safa" wordmark from @Image 1 in stages 1–3; it appears only in stage 4.

[Generation Goal]
Generate an 18-second, 9:16 vertical social-media video ad for the Canva feature "Magic Eraser". Photoreal product photography, warm and airy, premium but friendly. The video tells one story: a perfect product photo is spoiled by a stray hand at the edge, the creator removes it in Canva with Magic Eraser instead of reshooting, and the photo becomes post-ready. All on-screen text is in English, spelled exactly as written below, large, bold, white, clean geometric sans-serif (like Canva Sans), centred horizontally, placed in the upper-middle area of the frame, never in the top 14 % or bottom 35 % of the frame, with a subtle soft dark drop shadow for legibility. Maximum two lines of text at a time. No voiceover, no dialogue, no people's faces anywhere in the video.

[Stage 1 — 0–3 s — The problem]
Initial state: the exact scene from @Image 1, filling the whole 9:16 frame, photographed from the front at slight eye level; camera does a slow, smooth push-in.
Primary event: at about 1.5 seconds a real human hand with an index finger intrudes from the bottom-right edge of the photo, slightly out of focus, clearly accidental, like a photographer's finger in the shot. A quick subtle zoom-punch, and a thin red hand-drawn circle pops around the finger.
On-screen text, appearing at 0.3 s and staying until 3 s: "This photo was perfect… until I noticed THAT."
End state: the soap scene with the intruding finger circled in red, text visible.

[Stage 2 — 3–7 s — The action]
Continue from the previous stage: the same soap photo, now shown as an image on the canvas inside the Canva editor on a laptop screen, straight-on view of the screen filling the frame.
Canva editor look: clean white interface, light-grey canvas background, thin rounded panels. On the left a white "Edit image" panel listing Magic Studio tools as small rounded tiles; the tile "Magic Eraser" is selected and highlighted in Canva purple. Below it the option "Brush" is active next to "Click", with a "Brush size" slider, and a wide rounded purple button labelled "Erase". Canva purple is #8B3DFF / #7D2AE7, Canva teal is #00C4CC. Top-left a small Canva logo: a rounded lowercase "c" in a purple-to-teal gradient.
Primary event: a cursor with a round soft brush paints over the intruding finger; the painted area shows as a translucent purple highlight. The cursor then clicks the purple "Erase" button; the purple highlight shimmers with small sparkles for a moment while processing.
On-screen text, appearing at 3.2 s, staying until 7 s: "Reshoot it? Nope."
End state: the highlighted finger area is shimmering, about to disappear.

[Stage 3 — 7–13 s — The payoff]
Continue from the previous stage: same photo, same editor at first, then cut to the photo full-frame.
Primary event: the finger dissolves away and the travertine stone, linen and sand wall fill in seamlessly behind it, with no smudge, no blur and no leftover outline. Cut to the clean photo filling the whole 9:16 frame; a vertical white wipe line slides from left to right across the frame, revealing the fixed image: on the left side of the line the version with the finger, labelled "Before" in a small white pill, on the right side the clean version labelled "After" in a small purple pill. The wipe finishes at about 11 s; then the camera slowly pushes in on the clean, finished photo.
On-screen text, appearing at 7.2 s, staying until 13 s: "Just erase it."
End state: the clean soap photo full-frame, no finger, identical to @Image 1 in lighting and composition.

[Stage 4 — 13–18 s — The outcome]
Continue from the previous stage: the clean soap photo.
Primary event: the photo settles into a finished product post: the elegant teal-green serif wordmark "safa" with the small spaced caption "ORGANIC SOAP BAR" fades in above the soap bar exactly like in @Image 1, airy and balanced, like an Instagram-ready creative. At about 16 s a small end-card element appears in the lower-middle area (still above the bottom 35 % of the frame): the Canva purple-to-teal gradient rounded "c" logo, the word "Canva" next to it, and beneath them a rounded purple pill button with white text "Clean up your photo in Canva".
On-screen text, appearing at 13.2 s, staying until 16 s: "Post-ready. No reshoot required."
Then from 16 s to 18 s the CTA button text: "Clean up your photo in Canva"
End state: finished soap product post with the Canva logo and the CTA button, holding still for the last second.

[Maintain Consistency]
Keep the soap bar's shape, cream colour and upright position, the travertine stone, the speckled vase with baby's breath, the olive branch, the linen cloth, the warm sand wall, the light direction from the upper left and the overall warm palette identical across all stages. Keep the same camera side and eye level. Keep the Canva purple and teal exactly as specified and the editor white. Keep every on-screen text string spelled exactly as written, in the same font, size and upper-middle position, never overlapping the soap bar's label and never inside the top 14 % or bottom 35 % of the frame. Keep screen direction of the wipe left to right.

[Audio]
(Light, upbeat, modern acoustic-pop track with soft claps and a warm ukulele-guitar feel, starts at 0 s, builds gently, resolves with a clean ending at 18 s.)
<A soft comedic "uh-oh" blip and a tiny record-scratch when the finger is circled at about 1.8 s.>
<A soft UI click when Magic Eraser is selected, a gentle brush swish while the purple highlight is painted, and a second click on the Erase button.>
<A light magical shimmer while processing, a satisfying smooth "whoosh" when the finger dissolves, and a gentle success chime when the "After" side is revealed.>
<A final soft chime when the Canva CTA button appears.>
No dialogue, no voiceover, no lyrics.

[Avoid]
No voiceover, no spoken words, no subtitles other than the text specified, no misspelled or garbled letters, no extra text, no watermarks, no faces, no additional people, no other brand logos, no white halo or outline around objects, no flicker, no sudden camera shakes, no change of soap shape or colour, no text in the bottom third of the frame, no black bars.
```

## If something goes wrong in the draft

| Problem in draft | What to change |
| --- | --- |
| Text misspelled or garbled | Shorten the string for that stage (e.g. drop the ellipsis), put the text on its own line in the stage, and add "render the text sharply, as crisp vector lettering". If it still fails, remove the text from the prompt and add it in post (Canva/CapCut) — text position stays reserved. |
| Canva editor looks wrong / drifts | Use Seedance's time-scoped edit on the draft: "Edit 0:03–0:07 only: …" and re-describe the panel. Keep stages 1, 3 and 4 untouched. |
| Finger not removed cleanly | Strengthen stage 3: "the area behind the finger is restored to the exact original stone and linen texture from @Image 1, no smear". |
| Hand looks fake | Replace with "a blurred fingertip covering the bottom-right corner of the lens" (the classic photographer's-finger blur). |
| Wordmark in stage 4 wrong | Upload a second reference: a crop of only the "safa" logo from `soap-hero.png`, tag it `@Image 2 defines the wordmark; use it only in stage 4`. |
| Video shorter than 18 s | Make sure Duration is fixed 18 s, not Smart Duration. |
| Music has lyrics / a voice | Add to Audio: "instrumental only" and keep "No dialogue, no voiceover, no lyrics." |

Run 2–3 drafts at 480p, pick the best, then render that draft at 1080p (the render matches the approved draft).
