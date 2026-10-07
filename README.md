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

Before launching CLI/gateway **0.16.28** or desktop **0.3.24** with existing local
gateway state, stop all writers and follow the [offline state upgrade](https://github.com/citizenhicks/mobius/blob/mobius-gateway-v0.16.28/scripts/README-portable-upgrade.md).
Retain verified backups and pilot a disposable copy; starting the new gateway does
not migrate old configuration or history.

After preparing the state, upgrade using `brew update` and `brew upgrade`, then
reopen the CLI or run `mobius-gateway`. Starting a newer gateway automatically
replaces an older running version. Stop the gateway with `mobius-gateway exit` before uninstalling.
Uninstalling packages keeps your gateway data.

Packaging maintenance and checks: [Release procedure](docs/releasing.md).

Release archives, source, LICENSE and NOTICE: [citizenhicks/mobius](https://github.com/citizenhicks/mobius).
