class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.15.32/mobius-gateway-0.15.32-aarch64-apple-darwin.tar.gz"
      sha256 "05fe697a3be5129ddb0d1fdf09ff6305d2fea3a09a942884dd892f68c5bc6ec4"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.15.32/mobius-gateway-0.15.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "416a67077949c05dcb0af5b3b121dc3eccc2ac9009360bbc0888f9b90ffab157"
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
