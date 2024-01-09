class HelmLs < Formula
  desc "Language server for Helm"
  homepage "https://github.com/mrjosh/helm-ls"
  url "https://github.com/mrjosh/helm-ls.git",
      tag:      "v0.0.9",
      revision: "5dbde8a5d83a7cd3c21e55e8150100a2f7dd462e"
  license "MIT"
  head "https://github.com/mrjosh/helm-ls.git", branch: "master"

  depends_on "go" => :build

  def install
    system "make"
    bin.install "bin/helm_ls"

    generate_completions_from_executable(bin/"helm_ls", "completion")
  end

  test do
    system bin/"helm_ls", "version"
  end
end
