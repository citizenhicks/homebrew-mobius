# Packaging releases

The package updater follows stable CLI releases and uses the exact gateway version
pinned by each CLI, so a gateway-only release cannot break installed clients. The
update workflow also updates the Mac cask from the latest stable desktop release
and runs package checks against its resulting commit, including updates made by
the Actions token.

The existing workflows own the process:

- [Update packages](../.github/workflows/update.yml) reads stable public release
  tags, checksums, and the CLI's exact gateway requirement before updating formulas
  and the cask. It can run on its schedule or through its existing manual trigger.
- [Check packages](../.github/workflows/check.yml) checks package definitions,
  install/upgrade behavior, binary tests, and the Mac archive. The updater passes
  the exact resulting package commit to this reusable check.

Keep source release tags and checksums intact. Do not promote a desktop prerelease
or pair a stable CLI with an independently newer gateway. Installation and upgrade
commands remain in the [tap README](../README.md).

On 2026-10-07, the desktop cask was updated to stable 0.3.24 (11), bundling gateway
0.16.28 / protocol 92. It uses the verified immutable release ZIP and its published
SHA-256. The canonical cask passed Homebrew style and Ruby syntax checks; the
downloaded archive passed checksum, Sparkle-signature, Developer ID, and notarization
checks. Local `brew fetch` rejects this canonical checkout outside the installed
tap, so the published archive was verified directly and the installed tap was left
untouched. Existing local state requires the offline config upgrade linked in the
README before launching the new gateway.

On 2026-10-08, CLI and gateway formulas advance together to 0.16.29, using the immutable Apple Silicon and x86-64 Linux release archives and matching published checksums. Both packages preserve protocol 92 and config 28. State already upgraded to 0.16.28 needs no further conversion.

On 2026-10-08, the desktop cask advanced to stable 0.3.25 (12), bundling gateway 0.16.29 / protocol 92. Its immutable ZIP matches the published SHA-256 and passed fresh-download, Sparkle, Developer ID and notarization verification. The cask passed Homebrew style and Ruby syntax checks. The fixed website downloads and build-12 update feed were verified before publishing this cask.

On 2026-10-08, CLI and gateway formulas advance together to 0.16.30. Both Apple Silicon and x86-64 Linux archives were verified after extraction with their published immutable SHA-256 values. Protocol 92 and config 28 remain unchanged; no further conversion is required from 0.16.28 or 0.16.29.

On 2026-10-08, the desktop cask advanced to stable 0.3.26 (13), bundling gateway 0.16.30 / protocol 92. Its immutable ZIP matches the published SHA-256 and passed fresh-download, Sparkle, Developer ID and notarization verification. The cask passed Homebrew style and Ruby syntax checks. The fixed website downloads and build-13 update feed were verified before publishing this cask.

On 2026-10-08, CLI and gateway formulas advanced together to 0.16.31, and the
desktop cask advanced to stable 0.3.27 (14), bundling gateway 0.16.31 / protocol 92.
All five versioned public archives matched their published SHA-256 values and
release provenance; the released CLI pins gateway exactly. Protocol 92 and config 28 remain
unchanged, so no further conversion is required from 0.16.28 or newer.

The canonical definitions passed Ruby syntax, Homebrew style, and native strict
formula and cask audits. Both Mac command-line binaries reported 0.16.31 after
fresh download and extraction. The unchanged public desktop ZIP passed deep/strict
Developer ID, Gatekeeper, and stapling checks after extraction outside Documents
to avoid FileProvider metadata; its update feed contains build 14 and 19 prior
entries. GitHub Actions remained disabled. No installed tap or active package was
changed, so install/upgrade checks were not repeated locally. Verification receipts
are retained in shared `.mobius/releases.nosync/homebrew/0.16.31-desktop-0.3.27/`.

On 2026-10-08, the desktop cask advanced to stable 0.10.0 (15), bundling gateway
0.16.31 / protocol 92. The immutable ZIP matches the published SHA-256 and source
receipt; all six public release assets were verified against retained originals.
The cask passed Ruby syntax, Homebrew style and the native strict cask audit.
The fixed website downloads and build-15 appcast were verified before publishing
this cask. CLI and gateway formulas remain at 0.16.31.

GitHub Actions remained disabled. Verification used the canonical cask without
changing an installed tap or package, so installation and upgrade were not
repeated locally. Check receipts are retained in shared
`.mobius/releases.nosync/homebrew/desktop-0.10.0/`, alongside the desktop release
evidence in `.mobius/releases.nosync/desktop/0.10.0-15/`.

On 2026-10-09, the desktop cask advanced to stable 0.10.1 (16), bundling gateway
0.16.31 / protocol 92 from desktop source `521cd9f8125a52b2451b08e00dc7322324637d33`.
The immutable and fixed ZIP downloads match the retained signed archive's SHA-256;
the fixed DMG, website download link, Developer ID/notarization checks, and signed
build-16 Sparkle feed were verified. The canonical cask passed Ruby syntax, Homebrew style,
and a native strict cask audit without changing the installed tap or package.
CLI and gateway formulas remain at 0.16.31. Check receipts are retained in shared
`.mobius/releases.nosync/homebrew/desktop-0.10.1/`.

On 2026-10-09, the desktop cask advanced to stable 0.10.2 (17), bundling gateway
0.16.31 / protocol 92 from desktop source `74f4fb438bd320887bb7910132fadf0eea717d19`.
The immutable ZIP download matches the signed archive's SHA-256; the fixed ZIP and DMG,
Developer ID/notarization checks, and the signed build-17 Sparkle feed were verified.
The canonical cask passed Ruby syntax and Homebrew style without changing the installed
tap or package. CLI and gateway formulas remain at 0.16.31.

On 2026-10-10, the desktop cask advanced to stable 0.10.3 (18), bundling gateway
0.16.31 / protocol 92 from desktop source `92c71899142967ba4a4525752fde3402bc95a500`.
The immutable ZIP download matches the signed archive's SHA-256; the fixed ZIP and DMG,
Developer ID/notarization checks, and the signed build-18 Sparkle feed were verified.
The canonical cask passed Ruby syntax and Homebrew style without changing the installed
tap or package. CLI and gateway formulas remain at 0.16.31.

On 2026-10-10, the desktop cask advanced to stable 0.10.4 (19), bundling gateway
0.16.31 / protocol 92 from desktop source `5252a2b81ac3b706ba9083f255685b4e496d648a`.
The immutable ZIP download matches the signed archive's SHA-256; the fixed ZIP and DMG,
Developer ID/notarization checks, and the signed build-19 Sparkle feed were verified.
The canonical cask passed Ruby syntax and Homebrew style without changing the installed
tap or package. CLI and gateway formulas remain at 0.16.31.

On 2026-10-10, CLI and gateway formulas advanced together to 0.16.32 from source
`88c717b6358778898ad0e8ef72a1372d229afaab`. All four immutable Apple Silicon and
x86-64 Linux archives matched their published SHA-256 values after fresh download.
Their binaries, licenses and manuals are present; both Mac packages reported
0.16.32 after extraction. The Rust release checks separately verified the Linux
binaries. The CLI pins gateway exactly. Protocol 92 and config 28 remain unchanged,
so state already upgraded to 0.16.28 needs no further conversion.

Both canonical formulas passed Ruby syntax, Homebrew style and native strict
formula audits. GitHub Actions remain disabled. No installed tap or package was
changed, so installation and upgrade checks were not repeated locally. Receipts
are retained in shared
`.mobius/releases.nosync/homebrew/0.16.32-desktop-0.10.5/`. The desktop cask remains
at 0.10.4 pending its separate verified release.

On 2026-10-10, the desktop cask advanced to stable 0.10.5 (20), bundling gateway
0.16.32 / protocol 92 from desktop source `ff0cf32bc4e2c5c795f7112d0dedf953b4dd1c0a`.
The fresh immutable ZIP matches the signed archive's SHA-256 and contains the
expected build-20 bundle. All six GitHub release assets, Developer ID/notarization
checks, fixed ZIP and DMG downloads, website link and signed Sparkle feed were
verified by the desktop release lane. The public feed preserves all 19 prior
entries.

The canonical cask passed Ruby syntax, Homebrew style and a native strict audit.
GitHub Actions remain disabled; the installed tap and active packages remain
untouched. CLI and gateway formulas remain at 0.16.32. Check receipts are retained
in shared `.mobius/releases.nosync/homebrew/0.16.32-desktop-0.10.5/`, alongside the
desktop publication receipt in `.mobius/releases.nosync/desktop/0.10.5-20/`.

CLI and gateway formulas advance together to 0.16.33 from source
`ff385da846e588dec5ffee188a5c249313b031c9`, using the exact SHA-256 values of the
immutable Apple Silicon and x86-64 Linux release archives. The desktop cask stays
at 0.10.5; it still uses protocol 92 and must not be paired with this gateway.

Protocol 93 requires matching clients and an offline conversion of config 28→29,
Bot state 8→9 and checkpoint 19→20. Stop all writers, retain verified backups and
validate a disposable copy before starting the new gateway. SQLite user versions
are unchanged and do not identify the logical state format. The older portable
upgrade scripts do not perform this conversion. The formula caveat and README
link to the immutable
[0.16.33 release notes](https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.16.33).

Canonical formula checks and artifact pins are retained in shared
`.mobius/releases.nosync/release-0.16.33/homebrew/`. All four freshly downloaded
public archives and their checksum files match those pins. Ruby syntax,
Homebrew style and strict native formula audits passed against the canonical files.
GitHub Actions remain disabled and the installed tap and packages remain untouched;
installation and upgrade checks were not repeated locally.

On 2026-10-13, the desktop cask advanced to stable 0.10.10 (26), bundling gateway
0.16.33 / protocol 93 from desktop source `e45819ab8a2803a0f667a41b84096d4307731847`.
The freshly downloaded immutable ZIP matches SHA-256
`49f204f05098f43171a5197b02404e49e63ad013f388bbd5d67d103d8db7210e`;
Developer ID, notarization, Sparkle signature, fixed website downloads and the
build-26 feed were verified. Canonical Ruby syntax, Homebrew style and the strict
native content audit passed; the token matches the canonical filename.
GitHub Actions and the installed tap remain untouched. Installation and upgrade
were not repeated. Receipts are retained in shared
`.mobius/releases.nosync/homebrew/desktop-0.10.10/` and the desktop release folder.

On 2026-10-13, the CLI and gateway formula update to 0.16.34 was verified from
source `847a0378c14161d3f5b799f7cffafbd03ee616b6`. All four freshly downloaded
immutable Apple Silicon and x86-64 Linux archives and their checksum files match
the retained release artifacts. Every archived file matches its recorded hash,
size and mode; the extracted Mac binaries report 0.16.34. The published CLI pins
gateway exactly to 0.16.34. Linux execution is covered by the matching release
ABI and extracted-archive smoke receipts.

Protocol 93, config 29, Bot state 9 and checkpoint 20 are unchanged. State already
converted for 0.16.33 needs no additional conversion; older state still requires
the conversion linked in the immutable 0.16.33 release notes. The desktop cask
remains 0.10.12, bundling gateway 0.16.33 with protocol 93.

The canonical formula files passed Ruby syntax, Homebrew style and strict native
formula audits. Checks and artifact pins are retained in shared
`.mobius/releases.nosync/release-0.16.34/homebrew/`. GitHub Actions remain disabled.
No installed tap or package was changed, and no running gateway was restarted;
local installation and upgrade checks were not repeated.

On 2026-10-13, the desktop cask update to 0.10.13 (29), bundling gateway
0.16.34 / protocol 93, was verified from desktop source
`bdc8106712abb9554b962badbe0627ced9dc229a` and core
`847a0378c14161d3f5b799f7cffafbd03ee616b6`. The fresh immutable public ZIP matches
the retained signed, notarized archive's SHA-256
`3316c3ea8982403b739595432fb6afbb06937f93172f504d835e7a73c1c556d7`;
the public checksum and source receipt match the retained release evidence.

The canonical cask passed Ruby syntax, Homebrew style and a strict native cask
audit. Checks are retained in shared
`.mobius/releases.nosync/homebrew/desktop-0.10.13/`; signing and notarization
evidence is in `.mobius/releases.nosync/desktop/0.10.13-29/`. All six public assets
match retained originals. Stable promotion uploaded the fixed ZIP and DMG before
the signed build-29 Sparkle feed, preserving 19 older entries. Ordinary download
streams match the verified packages; the website's Mac link was confirmed in a
normal browser. The immutable release was a prerelease when cask checks completed
and is now stable and Latest.
No installed tap or package was changed and no running gateway was restarted.

On 2026-10-17, CLI and gateway 0.16.36 were verified from core source `290002ab5c89baea7274e4ec0a2533a2253743fd`. All four fresh public archives and their checksums matched retained originals; extracted files matched recorded hashes, sizes and modes. Mac binaries reported the expected version, and Linux ABI and extracted-archive smoke checks passed. The CLI pins gateway exactly. Protocol 95 requires matching clients; config 29, Bot state 9 and checkpoint 20 are unchanged.

The prepared desktop cask uses the verified immutable 0.10.15 (31) ZIP, bundling gateway 0.16.36. Its fresh public archive passed Sparkle signature, Developer ID, Gatekeeper and stapling verification. Canonical Homebrew style and strict native formula/cask audits passed. Evidence is retained in shared `.mobius/releases.nosync/release-0.16.36/homebrew/` and `.mobius/releases.nosync/desktop/0.10.15-31/`. GitHub Actions remained disabled. Installed taps and packages were left untouched, so local installation and upgrade checks were not repeated.

The 0.10.15 release is stable. After the three-account Cloud rollout completed, the fixed website ZIP and DMG were published before the Sparkle feed; fresh public streams matched the immutable hashes and the signed build-31 feed preserved 19 older entries. The website Mac link targets the verified fixed DMG. CLI, gateway and desktop packaging advance together.

On 2026-10-17, CLI and gateway formulas advanced to 0.16.37 from core
`3ccaf5da1871cd5b64e793f8ebdd1b677d0a0aab`. All four official archives were
downloaded again and checked against their named checksums and retained file
manifests. Canonical Ruby syntax, Homebrew style and strict native audits passed.
Protocol 95 and persisted-state versions are unchanged. The optional compaction
model inherits the conversation model unless selected explicitly. The desktop
cask remains unchanged. Evidence is retained in shared
`.mobius/releases.nosync/release-0.16.37/homebrew/`. Actions stayed disabled;
installed taps, installed packages and running local gateways were not changed.

On 2026-10-18, CLI and gateway formulas advanced together to 0.16.38 from core
`182d36c648790e2d974530b99dfb25d40d4fbd01`. All four fresh public Apple Silicon
and x86-64 Linux archives matched their published checksums and retained source
and file manifests, including every file's hash, size and mode. The extracted
Mac binaries reported 0.16.38; the matching Linux ABI and extracted-archive smoke
checks passed. The released CLI pins gateway exactly to 0.16.38.

Protocol 95, config 29, Bot state 9 and checkpoint 20 are unchanged. The release
reads history without starting stopped chats, combines text and image file
inspection, and shortens middleware guidance. The desktop cask remains 0.10.15,
bundling gateway 0.16.36, pending its separate release.

Canonical Ruby syntax, Homebrew style and strict native audits passed. Evidence
is retained in shared `.mobius/releases.nosync/release-0.16.38/homebrew/`.
GitHub Actions remain disabled. Installed taps, packages and running gateways
were left untouched; local installation and upgrade checks were not repeated.


On 2026-10-18, the desktop cask advanced to stable 0.10.16 (32), bundling gateway
0.16.38 / protocol 95 from desktop source
`b1eef96cc69e69ab5bbd1ef0600a452a778c64f5` and core
`182d36c648790e2d974530b99dfb25d40d4fbd01`. The fresh anonymous public ZIP matches
SHA-256 `8880aeabc5cf36d48487aca18ee67cdc262bf84bcbbde7a973010595c555a2ae`.
All six immutable public assets match retained originals. The extracted app's
version, build and embedded gateway, Developer ID signature, Gatekeeper,
notarization staple and Sparkle signature passed verification before the cask
was published.

The canonical cask passed Ruby syntax, Homebrew style and a strict native audit.
Evidence is retained in shared `.mobius/releases.nosync/homebrew/desktop-0.10.16/`
and `.mobius/releases.nosync/desktop/0.10.16-32/`. CLI and gateway formulas remain
0.16.38. GitHub Actions remain disabled. Installed taps and packages were not
changed and running gateways were not restarted; local installation and upgrade
checks were not repeated.
