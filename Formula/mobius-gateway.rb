class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.32/mobius-gateway-0.16.32-aarch64-apple-darwin.tar.gz"
      sha256 "8e9ea90ab94567d2b7acbb5bc9dcbd1278d0f35262fe19530bff822400fb20f4"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.32/mobius-gateway-0.16.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "feb466114f2128fe5ecc55ae3b7ef84014ec041036d2a2803633d962a646a55c"
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
        https://github.com/citizenhicks/mobius/blob/mobius-v0.16.32/scripts/README-portable-upgrade.md
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
