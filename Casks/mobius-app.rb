cask "mobius-app" do
  version "0.2.0"
  sha256 "4974c4da416712046043212c313da756ca2063537b9b9fe5a6309a4deb129335"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-desktop-v#{version}/mobius-desktop-#{version}.zip"
  name "möbius"
  desc "Native desktop client for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius.app"

  uninstall quit: "app.mobius.desktop"
end
