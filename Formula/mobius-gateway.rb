class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.42/mobius-gateway-0.16.42-aarch64-apple-darwin.tar.gz"
      sha256 "1e13e52fffcf7a42a96f2c8248addf10a1b4dbc7ca6edd61f706370125fa6500"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.42/mobius-gateway-0.16.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5bdc9b5dbe4297afa7470421efacf1b93250e5d38b4f4e8f3362653c34fab2cf"
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
      This gateway requires protocol 95 clients, config 29, Bot state 9,
      and checkpoint 20. State already converted for 0.16.33 needs no
      further conversion. For older state, stop all writers, retain verified
      backups, and convert offline before starting the new gateway:
        https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.16.33
      Older clients cannot connect. The existing portable upgrade scripts
      do not perform the 0.16.33 state conversion.
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
