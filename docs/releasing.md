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
