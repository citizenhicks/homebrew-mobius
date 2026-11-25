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

CLI, gateway and desktop **0.17.20** use protocol **106**. The desktop bundles
its matching gateway. Remote clients and gateways must both use protocol 106.
Users upgrading from 0.17.17 through 0.17.19 can keep their existing configuration and databases.
When upgrading from 0.17.14 or earlier, apply the clock setting described in the
[0.17.15 gateway upgrade notes](https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.17.15).

State from before 0.17.11 also needs the offline database conversion for that release:
Bot SQLite 6 to 7 and checkpoint SQLite 14 to 15, including retained
error/token/context journal events. Stop every writer and retain verified backups
of both databases first. Startup does not migrate state. See the
[0.17.11 upgrade notes](https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.17.11).
The 0.17.7 Mac update requires a fresh Cloud sign-in because credentials are now
isolated by the complete service URL.

Existing config **29** needs offline conversion to **30**: stop every writer,
retain verified state/database backups, preserve the complete usage record in
owner-only `usage.json`, remove the two retired OAuth callback timeout settings,
and materialize any missing middleware defaults without changing saved choices.
Convert custom model catalogs to shared reasoning presets, then run the released
`check-config` before starting. Preserve pairing identity, Bots, memory pages,
checkpoints and attachments. Bot state **10**, Bot SQLite **7**, checkpoint **21**
and checkpoint SQLite **15** are the 0.17.11 target formats. See the
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
