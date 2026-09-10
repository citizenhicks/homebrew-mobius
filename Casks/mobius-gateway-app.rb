cask "mobius-gateway-app" do
  version "0.15.11"
  sha256 "412eb08a29d19ba4c9e3443e49304742fdcba8578ebb57a43c7cbd3cf7670d6b"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v#{version}/mobius-gateway-menubar-#{version}-macos-ARM64-unnotarized.zip"
  name "möbius Gateway"
  desc "Menu bar companion and local gateway for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Mobius Gateway.app"

  uninstall quit: "app.mobius.gateway"

  caveats do
    <<~EOS
      This release is not notarized. macOS may require approval in
      System Settings > Privacy & Security before its first launch.
    EOS
  end
end
