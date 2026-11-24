class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.17.18/mobius-gateway-0.17.18-aarch64-apple-darwin.tar.gz"
      sha256 "93df246dd637ec26f1a01ecccb22f8f78c017f47d18dc7e7cf60afb30bbdf0e0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.17.18/mobius-gateway-0.17.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d85716def1eae6573d533318f5b051a54d71d6b36fb8888187ba48e66ee87a45"
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
      This gateway requires protocol 106 clients, config 30, Bot state 10,
      Bot SQLite schema 7, checkpoint 21, and checkpoint SQLite schema 15.
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
