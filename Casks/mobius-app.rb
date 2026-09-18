cask "mobius-app" do
  version "0.15.37"
  sha256 "5e73539603047b3399e3f78ba2c0b3fbbcf11b769d8d4fb64b88579e80121f93"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v#{version}/mobius-app-#{version}-macos-ARM64.zip"
  name "möbius-app"
  desc "Menu bar companion and local gateway for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius-app.app"

  uninstall quit: "app.mobius.gateway"
end
