class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.28/mobius-gateway-0.16.28-aarch64-apple-darwin.tar.gz"
      sha256 "52ba82af185b42725579ef3438a01bf699d109fb2ca5818d9abad299910957c3"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.28/mobius-gateway-0.16.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82c7ba0f4a609b802a3e0b0e1c6f6b1cb09e6266d13f2060893c1eb209f0d855"
    end
  end

  def install
    libexec.install "mobius-gateway", "cloudflared"
    bin.install_symlink libexec/"mobius-gateway"
    man1.install Dir["share/man/man1/*.1"]
    pkgshare.install "LICENSE", "NOTICE", "cloudflared-LICENSE"
  end

  def caveats
    <<~EOS
      Before launching 0.16.28 with existing state, stop all writers and perform
      the offline upgrade with verified backups:
        https://github.com/citizenhicks/mobius/blob/mobius-v0.16.28/scripts/README-portable-upgrade.md
      Starting the gateway does not migrate old configuration or history.
      Run `mobius-gateway` to open gateway setup.
      Starting a newer gateway replaces an older running gateway automatically.
      Stop a running gateway with `mobius-gateway exit` before uninstalling.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mobius-gateway --version")
  end
end
