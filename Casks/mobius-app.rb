cask "mobius-app" do
  version "0.10.2"
  sha256 "dc916ddbdf79a9a7f0a291d698ea1dfa661178be80c79b7c1884b52cce60fc64"

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
