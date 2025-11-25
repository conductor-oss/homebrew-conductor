class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.37"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.37/orkes_darwin_arm64"
      sha256 "2f9ad7d17d2b9ade002cb72c0fffe0af07f52a12982359342b0e297a0783cc49"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.37/orkes_darwin_amd64"
      sha256 "a21d6216b6b93970b8d1579bd70d458ff5f3e352098284c583d5d40c4490e7e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.37/orkes_linux_arm64"
      sha256 "b4a0e1bbacb6540f103710de8883a91ad14a6740e0e9bc7d5abd670643f231c7"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.37/orkes_linux_amd64"
      sha256 "ec7e265045a921147eb35932c424fbca4eec876eebba03cc7c3b0e1505cdd02b"
    end
  end

  def install
    bin.install "orkes_darwin_arm64" => "orkes" if Hardware::CPU.arm? && OS.mac?
    bin.install "orkes_darwin_amd64" => "orkes" if Hardware::CPU.intel? && OS.mac?
    bin.install "orkes_linux_arm64" => "orkes" if Hardware::CPU.arm? && OS.linux?
    bin.install "orkes_linux_amd64" => "orkes" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    system "#{bin}/orkes", "--version"
  end
end
