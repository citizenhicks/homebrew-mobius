class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.15.35/mobius-gateway-0.15.35-aarch64-apple-darwin.tar.gz"
      sha256 "2628690167cbae9b9c6af0b85a70fa0f2a0c98f96f1466e8f7228942578f175e"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.15.35/mobius-gateway-0.15.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba42f1483a5560698a211c75b06ad76e727a39d025306fd7bd11b780f33ea300"
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
      Run `mobius-gateway` to open gateway setup.
      Stop a running gateway with `mobius-gateway exit` before upgrading or uninstalling.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mobius-gateway --version")
  end
end
