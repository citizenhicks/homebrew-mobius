cask "mobius-app" do
  version "0.10.23"
  sha256 "819b15d544cc2b6f0dd00e97f84b7a0f9a05d2fbbfff148fef4a300f7963c801"

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
