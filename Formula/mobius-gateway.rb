class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.15/mobius-gateway-0.16.15-aarch64-apple-darwin.tar.gz"
      sha256 "c8076069dbc0889aa942ac4168aa6ceb696a2dea9c680d78052a233c571d1e33"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.15/mobius-gateway-0.16.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d11b50b324c8e4e773c9a16e2e1c0a55ecd67a5337e4570a3841ca70793b6bc8"
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
      Starting a newer gateway replaces an older running gateway automatically.
      Stop a running gateway with `mobius-gateway exit` before uninstalling.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mobius-gateway --version")
  end
end
