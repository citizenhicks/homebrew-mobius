cask "mobius-app" do
  version "0.3.0"
  sha256 "74629234d24803cf0bf5015161a32aefdeada8f9614cb71fbe666bbf67c4c686"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-desktop-v#{version}/mobius-desktop-#{version}.zip"
  name "möbius"
  desc "Native desktop client for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius.app"

  uninstall quit: "app.mobius.desktop"
end
