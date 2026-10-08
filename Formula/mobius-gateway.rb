class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.30/mobius-gateway-0.16.30-aarch64-apple-darwin.tar.gz"
      sha256 "42e2425e1ea8b2b386ee8c5c4cc57e73455def2de43bcbaf409f8b52ff0c9108"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.30/mobius-gateway-0.16.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af8c8a1a015840d2c9a2e6cec4b5bc21f7c3c1238c8a571c293f9bc13a1d8e7d"
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
      For state older than 0.16.28, stop all writers and perform
      the offline upgrade with verified backups:
        https://github.com/citizenhicks/mobius/blob/mobius-v0.16.30/scripts/README-portable-upgrade.md
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
