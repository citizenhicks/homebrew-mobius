cask "mobius-app" do
  version "0.15.46"
  sha256 "f79fa14a3b541c4218fab2ee56ec6f538241246d702bd79cfcb4be5393961cb5"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v#{version}/mobius-app-#{version}-macos-ARM64.zip"
  name "möbius-app"
  desc "Menu bar companion and local gateway for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius-app.app"

  uninstall quit: "app.mobius.gateway"
end
