class MobiusGateway < Formula
  desc "Headless host for möbius Bots and sessions"
  homepage "https://github.com/citizenhicks/mobius"
  version "0.15.11"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v#{version}/mobius-gateway-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "99bd5ce720afd468b46bd0ebb4ac81fe84d9ccffb485009a69c132774bce0dd9"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/citizenhicks/mobius/releases/download/mobius-gateway-v#{version}/mobius-gateway-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d1f66d0188358aee401b4925b6a5f7b05640ad9e98d9e44397318be6f5b06019"
  end

  def install
    libexec.install "mobius-gateway", "cloudflared"
    bin.install_symlink libexec/"mobius-gateway"
    man1.install Dir["share/man/man1/*.1"]
    pkgshare.install "LICENSE", "NOTICE", "cloudflared-LICENSE"
  end

  def caveats
    <<~EOS
      Run `mobius-gateway install` to set up and start your local gateway.
      Run `mobius-gateway uninstall` before uninstalling an installed service.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mobius-gateway --version")
  end
end
