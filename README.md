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

CLI/gateway **0.16.46** requires protocol **97** clients. State from before
**0.16.44** requires manual offline conversion to Bot state **10**, checkpoint
**21**, and checkpoint SQLite schema **14**. Gateway config **29** and Bot SQLite
schema **6** stay unchanged; the scratchpad capability becomes memory. Stop all
writers, retain verified backups, and validate a disposable copy before converting.
Startup does not migrate configuration or history. Do not use the older portable
upgrade scripts for this conversion. See the
[0.16.44 release notes](https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.16.44).
Upgrading from 0.16.44 or 0.16.45 to 0.16.46 needs no additional state conversion.

The current desktop cask **0.10.27** uses protocol **97** and bundles gateway
**0.16.46**. Keep gateways used by older protocol clients on their compatible
release until those clients are upgraded.

After preparing the state, upgrade using `brew update` and `brew upgrade`, then
reopen the CLI or run `mobius-gateway`. Starting a newer gateway automatically
replaces an older running version. Stop the gateway with `mobius-gateway exit` before uninstalling.
Uninstalling packages keeps your gateway data.

Packaging maintenance and checks: [Release procedure](docs/releasing.md).

Release archives, source, LICENSE and NOTICE: [citizenhicks/mobius](https://github.com/citizenhicks/mobius).
