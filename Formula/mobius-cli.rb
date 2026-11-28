class MobiusCli < Formula
  desc "Terminal client for möbius"
  homepage "https://github.com/citizenhicks/mobius"
  url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v0.17.22/mobius-0.17.22-aarch64-apple-darwin.tar.gz"
  sha256 "b5161e0d30721ab9fa0c24035c7e68f7d8a30ad3c9ed9aa3301c04ecd0de1bbe"
  license "Apache-2.0"

  depends_on "citizenhicks/mobius/mobius-gateway"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/citizenhicks/mobius/releases/download/mobius-cli-v0.17.22/mobius-0.17.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a790a4a222970d09cecb025bada98f6056f521aee2fe54dfc0cd0b5dd879873"
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
