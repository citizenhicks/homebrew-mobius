cask "mobius-app" do
  version "0.15.47"
  sha256 "cc8c67b3dab9eecb1187d1ebe6cb453dfa70a4de8f2e5d68f6d3fb32b1b2dfc1"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v#{version}/mobius-app-#{version}-macos-ARM64.zip"
  name "möbius-app"
  desc "Menu bar companion and local gateway for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius-app.app"

  uninstall quit: "app.mobius.gateway"
end
