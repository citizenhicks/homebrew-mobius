class MobiusCli < Formula
  desc "Terminal client for möbius"
  homepage "https://github.com/citizenhicks/mobius"
  license "Apache-2.0"

  depends_on "citizenhicks/mobius/mobius-gateway"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v0.16.25/mobius-0.16.25-aarch64-apple-darwin.tar.gz"
      sha256 "4918c832379cc24f3b8d9652a30b29ec287ece459242fc9ee663e3e4e6b66c24"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v0.16.25/mobius-0.16.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ba6692059797769dcc49d37922fb88bfd984744d42fc74d8cb113393b457556"
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
