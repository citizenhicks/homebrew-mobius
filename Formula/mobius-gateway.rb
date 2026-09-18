class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.15.37/mobius-gateway-0.15.37-aarch64-apple-darwin.tar.gz"
      sha256 "d5e2de5a821d6110506788ade2aea6106731b3f2d4ba4ae8e85330f425222dba"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.15.37/mobius-gateway-0.15.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a995504f853ea1663fb55b2c2561c44cd57ab5867fc9fd18ce84d5583fdb94e2"
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
