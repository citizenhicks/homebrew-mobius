class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.27/mobius-gateway-0.16.27-aarch64-apple-darwin.tar.gz"
      sha256 "12348b8d76f0fd2ad6452eab0f01f516e32a8daf4b1705f77341ba4aad2a15f2"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v0.16.27/mobius-gateway-0.16.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "450420c5a9df8d66eef575da3927a864d5e1dce7feb1d56b297bb327e55719c8"
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
      Before launching 0.16.27 with existing state, stop all writers and perform
      the offline upgrade with verified backups:
        https://github.com/citizenhicks/mobius/blob/mobius-v0.16.27/scripts/README-portable-upgrade.md
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
