class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.17.7/mobius-gateway-0.17.7-aarch64-apple-darwin.tar.gz"
      sha256 "f018627041e26f929c1fbff144492f4c130ab67657cb721bad2fec51eca9bcf1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.17.7/mobius-gateway-0.17.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45bb4081dd3a8a748f7789c13aff1cc534a32c32949d35c4c5c316c2b22eb718"
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
      This gateway requires protocol 101 clients, config 30, Bot state 10,
      checkpoint 21, and checkpoint SQLite schema 14 (Bot SQLite remains 6).
      State prepared for 0.17.2 needs no further conversion.
      Config 29 requires manual offline conversion. Stop all writers,
      retain verified backups, and validate a disposable copy before upgrading:
        https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.17.1
      Older clients cannot connect. Do not use the older portable upgrade
      scripts for this conversion.
      Starting the gateway does not migrate old configuration or history.
      Memory pages now use Markdown files; old memory rows are retained but not migrated.
      Run `mobius-gateway` to open gateway setup.
      Starting a newer gateway replaces an older running gateway automatically.
      Stop a running gateway with `mobius-gateway exit` before uninstalling.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mobius-gateway --version")
  end
end
