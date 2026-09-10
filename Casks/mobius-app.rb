cask "mobius-app" do
  version "0.15.14"
  sha256 "6a9124b918bb1a58148cb0aff0f9063a1c7630dc989b031860c3057006e2d150"

  url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v#{version}/mobius-app-#{version}-macos-ARM64-unnotarized.zip"
  name "möbius-app"
  desc "Menu bar companion and local gateway for möbius"
  homepage "https://github.com/citizenhicks/mobius"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "möbius-app.app"

  uninstall quit: "app.mobius.gateway"

  caveats do
    <<~EOS
      This release is not notarized. macOS may require approval in
      System Settings > Privacy & Security before its first launch.
    EOS
  end
end
