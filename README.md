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

CLI/gateway **0.16.40** requires protocol **95** clients. State already converted
for **0.16.33** needs no further conversion. Older state requires the offline
conversion to gateway config **29**, Bot state **9**, and checkpoint **20**.
Stop all writers, retain verified backups, and pilot a disposable copy before
converting. Startup does not migrate configuration or history, and the existing
portable upgrade scripts do not perform the 0.16.33 conversion. See the
[0.16.33 release notes](https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.16.33).

The current desktop cask **0.10.19** uses protocol **95** and bundles gateway
**0.16.39**. Keep gateways used by older protocol clients on their compatible
release until those clients are upgraded.

After preparing the state, upgrade using `brew update` and `brew upgrade`, then
reopen the CLI or run `mobius-gateway`. Starting a newer gateway automatically
replaces an older running version. Stop the gateway with `mobius-gateway exit` before uninstalling.
Uninstalling packages keeps your gateway data.

Packaging maintenance and checks: [Release procedure](docs/releasing.md).

Release archives, source, LICENSE and NOTICE: [citizenhicks/mobius](https://github.com/citizenhicks/mobius).
