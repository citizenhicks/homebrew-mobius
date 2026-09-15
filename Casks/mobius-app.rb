cask "mobius-app" do
  version "0.15.29"
  sha256 "61608010821c92cdc5da507eb60b32dcfb49d4f2e7c14637cd9b2e0305870fef"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v#{version}/mobius-app-#{version}-macos-ARM64.zip"
  name "möbius-app"
  desc "Menu bar companion and local gateway for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius-app.app"

  uninstall quit: "app.mobius.gateway"
end
