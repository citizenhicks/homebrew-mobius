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

Install the Mac menu bar app:

```sh
brew install --cask mobius-app
open -a "möbius-app"
```

The app bundles its gateway and uses the same local installation as the command-line tools.
The current app requires macOS 26 or newer on Apple Silicon. CLI and gateway archives
are available for Apple Silicon Macs and x86-64 Linux.

The Mac app is Developer ID signed and notarized.

Upgrade using `brew update` and `brew upgrade`. Stop a running gateway with
`mobius-gateway exit` before upgrading, then reopen the CLI or menu bar app.
Uninstalling packages keeps your gateway data.

Release archives, source, LICENSE and NOTICE: [citizenhicks/mobius](https://github.com/citizenhicks/mobius).
