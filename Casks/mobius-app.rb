cask "mobius-app" do
  version "0.15.44"
  sha256 "855d8dcb375282fdafd4fc16ee6b1e7ca48a1d8158d21c9bf136204be855851a"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v#{version}/mobius-app-#{version}-macos-ARM64.zip"
  name "möbius-app"
  desc "Menu bar companion and local gateway for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius-app.app"

  uninstall quit: "app.mobius.gateway"
end
