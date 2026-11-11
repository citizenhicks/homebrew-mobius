# möbius Homebrew tap

Install the terminal client and gateway:

```sh
brew tap citizenhicks/mobius
brew trust citizenhicks/mobius
brew install mobius-cli
```

The CLI includes the gateway as a dependency. For a gateway without the terminal client:

```sh
brew install mobius-gateway
mobius-gateway
```

Install the native Mac desktop app:

```sh
brew install --cask mobius-app
open -a "möbius"
```

The desktop app requires macOS 26 or newer on Apple Silicon. Upgrading the existing
`mobius-app` cask replaces the retired `möbius-app.app` with `möbius.app` and keeps
your gateway data. CLI and gateway archives are available for Apple Silicon Macs
and x86-64 Linux.

The Mac app is Developer ID signed and notarized.

CLI, gateway and desktop **0.17.3** use protocol **101**. The desktop bundles
its matching gateway. Upgrade other gateways used by these clients to protocol 101.
State already prepared for 0.17.2 needs no further conversion.

Existing config **29** needs offline conversion to **30**: stop every writer,
retain verified state/database backups, preserve the complete usage record in
owner-only `usage.json`, remove the two retired OAuth callback timeout settings,
and materialize any missing middleware defaults without changing saved choices.
Convert custom model catalogs to shared reasoning presets, then run the released
`check-config` before starting. Preserve pairing identity, Bots, memory pages,
checkpoints and attachments. Bot state **10**, Bot SQLite **6**, checkpoint **21**
and checkpoint SQLite **14** remain unchanged from 0.16.50. See the
[offline upgrade instructions](https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.17.1).

State older than 0.16.44 also needs its earlier manual data conversion; see the
[0.16.44 notes](https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.16.44).
Memory uses linked Markdown pages; legacy memory rows remain stored until migrated
manually. Startup does not migrate configuration or history.

After preparing the state, upgrade using `brew update` and `brew upgrade`, then
reopen the CLI or run `mobius-gateway`. Starting a newer gateway automatically
replaces an older running version. Stop the gateway with `mobius-gateway exit` before uninstalling.
Uninstalling packages keeps your gateway data.

Packaging maintenance and checks: [Release procedure](docs/releasing.md).

Release archives, source, LICENSE and NOTICE: [citizenhicks/mobius](https://github.com/citizenhicks/mobius).
