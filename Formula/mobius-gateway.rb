class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.17.22/mobius-gateway-0.17.22-aarch64-apple-darwin.tar.gz"
  sha256 "ac0eb30ceb4b85a2e310d6adf518f32dbdca91416a1bb5cc844716de11246c97"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.17.22/mobius-gateway-0.17.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b565d2f6ac57f1d051649166fe983381ab584a2b3ef4186eb6c89ba313b80de"
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
      This gateway requires protocol 111 clients, config 30, Bot state 10,
      Bot SQLite schema 7, checkpoint 21, and checkpoint SQLite schema 15.
      Before upgrading from 0.17.19–0.17.21, stop all writers, back up both SQLite
      databases, and apply the indexes in the gateway release notes:
        https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.17.22
      For state from 0.17.14 or earlier, see the clock setting in:
        https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.17.15
      For state from before 0.17.11, see the offline database conversion in:
        https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.17.11
      Config 29 requires manual offline conversion. Stop all writers,
      retain verified backups, and validate a disposable copy before upgrading:
        https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.17.1
      The older portable upgrade scripts do not perform this conversion.
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
