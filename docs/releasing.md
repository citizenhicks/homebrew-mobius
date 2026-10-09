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
