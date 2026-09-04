# Getting StockWatch onto your wrist, from zero

You have never opened Xcode. That is fine. This is the whole path, in order.
Steps 1–7 put the app on your own watch. Step 8 is only if you want it on the App Store.

## 0. What you need

- A Mac (any Apple-silicon or recent Intel Mac). There is no way around this: Apple's build
  tools only run on macOS.
- An iPhone paired with your Apple Watch, both on recent software (watchOS 10 or newer).
- Your Apple ID. A free one is enough to install on your own watch.
- About 30 GB of free disk for Xcode.

## 1. Install Xcode (~30–60 min, mostly download)

1. Open the **App Store** on the Mac, search **Xcode**, click **Get**. It is free and large.
2. Open Xcode once. It asks to install "additional components"; say yes.
3. Xcode → **Settings** → **Platforms**: make sure **watchOS** is installed (download it if not).
   This gives you the Apple Watch simulator.

## 2. Get the code

1. Install Homebrew if you don't have it: open **Terminal** (Cmd+Space, type Terminal) and
   paste the one-liner from <https://brew.sh>.
2. In Terminal:
   ```sh
   brew install git xcodegen
   git clone https://github.com/przemekzajac/creative-system-test.git
   cd creative-system-test
   git checkout claude/smartwatch-stock-returns-nnirrn
   cd StockWatch
   ```

## 3. Get a free Finnhub API key (2 min)

1. Go to <https://finnhub.io/register>, sign up, copy the key from the dashboard.
2. Open `StockWatch/Secrets.swift` in any text editor and replace `YOUR_FINNHUB_API_KEY`
   with your key. Keep the quotes.
3. Do not share this file or commit it publicly; the key is tied to your account.

## 4. Generate and open the Xcode project

```sh
xcodegen generate
open StockWatch.xcodeproj
```
Xcode opens with the project. On the left you see the files; the big area is the editor.

## 5. Tell Xcode who you are (signing)

Apple requires every app on a real device to be signed by an Apple ID.

1. Xcode → **Settings** → **Accounts** → **+** → **Apple ID** → sign in.
2. In the left file list click the top item **StockWatch** (blue icon). In the middle pane
   select the **StockWatch** target, then the **Signing & Capabilities** tab.
3. Tick **Automatically manage signing** and choose your name under **Team**.
4. If Xcode complains the bundle identifier is taken, change
   `com.przemekzajac.StockWatch.watchkitapp` to anything unique, e.g. add your initials.

## 6. Run it in the simulator (no watch needed)

1. Top of the window, next to the play button, click the device menu and pick
   **Apple Watch Series 10 (46mm)** or similar under *watchOS Simulators*.
2. Press the **▶ Run** button (or Cmd+R). First build takes a minute or two.
3. A virtual watch appears. Scroll with the mouse wheel or two-finger swipe to move between
   stocks; that is the Digital Crown.
4. If the screen says **No API key**, step 3 was skipped.

## 7. Run it on your real watch

1. Plug the iPhone into the Mac with a cable and unlock it. Tap **Trust** if asked.
2. On the iPhone: **Settings → Privacy & Security → Developer Mode → on**, restart.
   On the watch: **Settings → Privacy & Security → Developer Mode → on**, restart.
3. In Xcode's device menu the watch now appears under its own name (it may take a minute the
   first time; keep the watch on your wrist and unlocked). Select it and press **Run**.
4. First time only, the watch shows "Untrusted developer". On the iPhone go to
   **Settings → General → VPN & Device Management**, tap your Apple ID, tap **Trust**.
   Run again from Xcode.
5. The app is now installed and stays there like any other app.

Fine print with a **free** Apple ID: the app stops launching after **7 days** and you re-run
step 7.3 to refresh it. Joining the Apple Developer Program (**$99/year**) extends that to
one year and is required for step 8.

## 8. Publishing on the App Store (optional)

Only needed if you want other people to install it. Roughly a week of elapsed time.

1. Enroll at <https://developer.apple.com/programs/enroll/> ($99/year, needs ID verification,
   1–2 days).
2. Switch the data source to a paid Finnhub plan or another licensed feed. Finnhub's free tier
   is for personal, non-commercial use only; a public app violates that.
3. In <https://appstoreconnect.apple.com> create the app record: name, bundle identifier
   (must match Xcode), privacy policy URL, category (Finance).
4. In Xcode: **Product → Archive**, then **Distribute App → App Store Connect → Upload**.
5. In App Store Connect: add screenshots (take them from the simulator with Cmd+S), a
   description, age rating, and the privacy questionnaire. Submit for review.
6. Review usually takes 1–3 days. Expect Apple to ask about the data source and to require
   a "data may be delayed" disclaimer for financial apps.

## When something goes wrong

- **"No such module" or red errors on first open** — wait for the top bar to finish
  "Indexing", then **Product → Clean Build Folder** (Shift+Cmd+K) and run again.
- **Watch not in the device list** — iPhone must be cabled and unlocked, watch on wrist and
  unlocked, both with Developer Mode on. Xcode → **Window → Devices and Simulators** shows
  pairing progress.
- **"Rate limited" in the footer** — more than 60 calls a minute hit Finnhub; wait a minute.
- **A ticker shows "No data for X"** — the symbol is not on Finnhub; check the spelling in
  `StockWatch/Models/Stock.swift`.
