class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.44/mobius-gateway-0.16.44-aarch64-apple-darwin.tar.gz"
      sha256 "cab1a3ed3013e448efb31e536c556abca9ae07616c994e8c6b1af11e6eef3471"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.44/mobius-gateway-0.16.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2c55284ce83c7164a68b93101b3dc93835f5c6be535efa804667c67f8568bc5"
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
