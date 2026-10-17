class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.38/mobius-gateway-0.16.38-aarch64-apple-darwin.tar.gz"
      sha256 "5e644d53e1866c4cb8a497f0c776dab90e3c733e00005d5bc5725caab7894197"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.38/mobius-gateway-0.16.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b4bc7dc29be0fb70159fb64b972683e585a958db9fa148ee58f952ee52817c41"
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
