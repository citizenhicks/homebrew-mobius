cask "mobius-app" do
  version "0.10.15"
  sha256 "17e3a6ad03d138b39416ee9f35ce5031d833e85d33a787c84fcf6bed88d03ea3"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-desktop-v#{version}/mobius-desktop-#{version}.zip"
  name "möbius"
  desc "Native desktop client for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  livecheck do
    url :url
    regex(/^mobius-desktop-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius.app"

  uninstall quit: "app.mobius.desktop"
end
