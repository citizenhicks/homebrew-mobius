class MobiusCli < Formula
  desc "Terminal client for möbius"
  homepage "https://github.com/citizenhicks/mobius"
  version "0.15.11"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v#{version}/mobius-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "3184c1f96f8becdf0f740ce999a73f40a83be2d3989527122e020b142a035048"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v#{version}/mobius-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e2e3591b790526c74ce7200fe76ed0b772669283486e5932deddf3c4772c018d"
  end

  depends_on "citizenhicks/mobius/mobius-gateway"

  def install
    libexec.install "mobius"
    libexec.install_symlink Formula["mobius-gateway"].opt_libexec/"mobius-gateway"
    bin.install_symlink libexec/"mobius"
    man1.install Dir["share/man/man1/mobius*.1"].reject { |path| path.include?("mobius-gateway") }
    pkgshare.install "LICENSE", "NOTICE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mobius --version")
    assert_predicate libexec/"mobius-gateway", :executable?
  end
end
