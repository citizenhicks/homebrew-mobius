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

CLI/gateway **0.16.33** requires protocol **93** clients and an offline state
conversion: gateway config **28→29**, Bot state **8→9**, and checkpoint **19→20**.
Stop all writers, retain verified backups, and pilot a disposable copy before
upgrading. Startup does not migrate configuration or history, and the existing
portable upgrade scripts do not perform this release's conversion. See the
[0.16.33 release notes](https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.16.33).

The current desktop cask **0.10.5** uses protocol **92** and cannot connect to this
gateway. Keep gateways used by older clients on their compatible release until
the clients have been upgraded. The desktop cask is unchanged by this release.

After preparing the state, upgrade using `brew update` and `brew upgrade`, then
reopen the CLI or run `mobius-gateway`. Starting a newer gateway automatically
replaces an older running version. Stop the gateway with `mobius-gateway exit` before uninstalling.
Uninstalling packages keeps your gateway data.

Packaging maintenance and checks: [Release procedure](docs/releasing.md).

Release archives, source, LICENSE and NOTICE: [citizenhicks/mobius](https://github.com/citizenhicks/mobius).
