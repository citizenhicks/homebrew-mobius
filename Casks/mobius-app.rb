cask "mobius-app" do
  version "0.3.10"
  sha256 "68ca82a97b1570952dfc14a18eecf66f58fce6bba161b56e7112ea18a08ea089"

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
