class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.45"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.45/orkes_darwin_arm64"
      sha256 "a7baedc5148aed7a6771bb20dbcec457bbe2a39638344f463b093452e991d796"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.45/orkes_darwin_amd64"
      sha256 "340fba680117e3f6e5308a34b0ad2ddf0f8e0f727786404431ea8a46a5698b61"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.45/orkes_linux_arm64"
      sha256 "e385126afe596b3c73447a28d0ffe2514013c056d8e1a21dabe5283704b8f8b8"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.45/orkes_linux_amd64"
      sha256 "738124ef479e9f02542bf65e0343da2880bcf9c4a25d7d1291ddba12fa211d5f"
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
