class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.33/mobius-gateway-0.16.33-aarch64-apple-darwin.tar.gz"
      sha256 "4df23e5f3eaa5e89bebcbb1e9b100da9640e118cf85d8c36221397d61b9efe1a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.33/mobius-gateway-0.16.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "93b89fb57c294a36cc48493c05539c76914e43aa644b50d9dd19a00fd9db468a"
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
      This gateway requires protocol 93 clients, config 29, Bot state 9,
      and checkpoint 20. Stop all writers, retain verified backups, and
      convert existing state offline before starting the new gateway:
        https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.16.33
      Older clients cannot connect. The existing portable upgrade scripts
      do not perform this release's state conversion.
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
