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

The retired Mac menu bar app remains available at 0.15.49:

```sh
brew install --cask mobius-app
open -a "möbius-app"
```

The legacy app bundles its gateway and uses the same local installation as the command-line tools.
It requires macOS 26 or newer on Apple Silicon. The current native desktop and SwiftUI
apps are maintained in separate repositories. CLI and gateway archives
are available for Apple Silicon Macs and x86-64 Linux.

The Mac app is Developer ID signed and notarized.

Upgrade using `brew update` and `brew upgrade`, then reopen the CLI or run
`mobius-gateway`. Starting a newer gateway automatically replaces an older running
version. Stop the gateway with `mobius-gateway exit` before uninstalling.
Uninstalling packages keeps your gateway data.

Release archives, source, LICENSE and NOTICE: [citizenhicks/mobius](https://github.com/citizenhicks/mobius).
