class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.45/mobius-gateway-0.16.45-aarch64-apple-darwin.tar.gz"
      sha256 "d869a361c1d9ff34adeced3ea627889723dc34e97308fefd60c6d83fff09030c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.45/mobius-gateway-0.16.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6bdc3c40bc4dd7adab581313e31eecf45ae188dbd4d597382a1ca673cb54943"
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
      This gateway requires protocol 97 clients, config 29, Bot state 10,
      checkpoint 21, and checkpoint SQLite schema 14 (Bot SQLite remains 6).
      Earlier state requires manual offline conversion. Stop all writers,
      retain verified backups, and validate a disposable copy before upgrading:
        https://github.com/citizenhicks/mobius/releases/tag/mobius-gateway-v0.16.44
      Older clients cannot connect. Do not use the older portable upgrade
      scripts for this conversion.
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
