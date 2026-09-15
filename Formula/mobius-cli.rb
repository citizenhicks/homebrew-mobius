class MobiusCli < Formula
  desc "Terminal client for möbius"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  depends_on "citizenhicks/mobius/mobius-gateway"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v0.15.29/mobius-0.15.29-aarch64-apple-darwin.tar.gz"
      sha256 "8321932ae4fa30e4ec1fa38369b5dcf34b0e38160e0fb55eca63dea7aabbf409"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v0.15.29/mobius-0.15.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc15dd30defef2ccf578792ef7e2e65921779a8ee50ccc25c6dde1790898ccf2"
    end
  end

  def install
    libexec.install "mobius"
    libexec.install_symlink formula_opt_libexec("mobius-gateway")/"mobius-gateway"
    bin.install_symlink libexec/"mobius"
    man1.install Dir["share/man/man1/mobius*.1"].reject { |path| path.include?("mobius-gateway") }
    pkgshare.install "LICENSE", "NOTICE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mobius --version")
    assert_predicate libexec/"mobius-gateway", :executable?
  end
end
