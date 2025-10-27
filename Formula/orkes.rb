class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.33/orkes_darwin_arm64"
      sha256 "935aee7b606b9bdf196d8acd76e04fb741d979964ac6006f214a179eae7e597b"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.33/orkes_darwin_amd64"
      sha256 "7a4d1240364ec49d3af56253cb3fe505d3ded276f846f3a8ce2543846c12a37e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.33/orkes_linux_arm64"
      sha256 "10deb29bd179a99f77efe4ebf4028b173b79669ab7797b7145878bb473a3e317"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.33/orkes_linux_amd64"
      sha256 "3aa4785e49de0ce5e2c6df5c456f4a0f2a0677e0685801f4793ac820e6d5e882"
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
