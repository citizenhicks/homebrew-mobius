cask "mobius-app" do
  version "0.2.10"
  sha256 "e5895509163f6da9957f198486e1a5c165b84f7d9c55a23a883a28db0cadf1d5"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-desktop-v#{version}/mobius-desktop-#{version}.zip"
  name "möbius"
  desc "Native desktop client for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius.app"

  uninstall quit: "app.mobius.desktop"
end
