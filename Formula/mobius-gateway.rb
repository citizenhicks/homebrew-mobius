class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.15.36/mobius-gateway-0.15.36-aarch64-apple-darwin.tar.gz"
      sha256 "e8fd998f176a6ca1d48896811e73fe085dfdeefecee45b91f5bdf883829e176d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.15.36/mobius-gateway-0.15.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "691483335492f49ef2f05d5475dba6bace2a2ff2ee889f82ed965754d62dafb4"
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
