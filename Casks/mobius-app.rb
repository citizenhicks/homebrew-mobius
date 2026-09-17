cask "mobius-app" do
  version "0.15.36"
  sha256 "dae4b441f2be0cf737152da3cbb46cffc064f91ff29546f80a9bafa230123adc"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v#{version}/mobius-app-#{version}-macos-ARM64.zip"
  name "möbius-app"
  desc "Menu bar companion and local gateway for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius-app.app"

  uninstall quit: "app.mobius.gateway"
end
