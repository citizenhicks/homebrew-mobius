cask "mobius-app" do
  version "0.2.9"
  sha256 "cf121cf067fee25fcffbd5f1340eb2f32575f118ee1c8be7a0dfb4f32d2a18dd"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-desktop-v#{version}/mobius-desktop-#{version}.zip"
  name "möbius"
  desc "Native desktop client for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius.app"

  uninstall quit: "app.mobius.desktop"
end
