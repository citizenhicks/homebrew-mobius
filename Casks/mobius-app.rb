cask "mobius-app" do
  version "0.2.8"
  sha256 "716979b6f75e1528a602044a86969e835bda261709c56eb2e3a90d1f8dc6f3b5"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-desktop-v#{version}/mobius-desktop-#{version}.zip"
  name "möbius"
  desc "Native desktop client for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius.app"

  uninstall quit: "app.mobius.desktop"
end
