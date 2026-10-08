class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.31/mobius-gateway-0.16.31-aarch64-apple-darwin.tar.gz"
      sha256 "49761038ef8aa2e7bdd8e7c542ae2ce45618633a81a45f74505c160e980e0bf8"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.31/mobius-gateway-0.16.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51642058226b0bea9442fed84bdcf9a902dcb1a3f34188c425fe39ab90503ad6"
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
        https://github.com/citizenhicks/mobius/blob/mobius-v0.16.31/scripts/README-portable-upgrade.md
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
