cask "mobius-app" do
  version "0.10.8"
  sha256 "77968a3e8903a633386f127c0da317df8549c1b3fb80bbbf22aef1aa1e51f029"

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
