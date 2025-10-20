class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.26/orkes_darwin_arm64"
      sha256 "e126837513bb69b1eb5169e8c32f544f6eb6fa727b6033e41e4ce5ee85943a7a"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.26/orkes_darwin_amd64"
      sha256 "aa9d230de84cfcb1e4cc935f043baa906a13e74b5adba1836d53c32a9bc96ea4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.26/orkes_linux_arm64"
      sha256 "e1137aab014032d96ff1b9011255a688d62a6ff3ffce9518746fc24ad3d264f7"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.26/orkes_linux_amd64"
      sha256 "eeaf1d6c756c293534d1bfb27d16024b92923d01e0897919dc63175a866a34f6"
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
