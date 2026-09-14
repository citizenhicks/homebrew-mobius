class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.15.25/mobius-gateway-0.15.25-aarch64-apple-darwin.tar.gz"
      sha256 "b1744ff6a98d9edaff0a9ae24d1d917ad633d0aae444aac6929cf75700d62efa"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.15.25/mobius-gateway-0.15.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee8f6575d70231aacf8ea80a444f0f63d81b7603314ebcc07bfe7c94f2da0f10"
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
