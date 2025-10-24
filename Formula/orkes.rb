class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.31/orkes_darwin_arm64"
      sha256 "d9f94b1d5371883d7311850a9d4f362203f5b2874252d682e84b4de9ce366a00"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.31/orkes_darwin_amd64"
      sha256 "75c85c087f95027cde6f1a37245fbc8ded556e1df551c168bf0655103d69a3e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.31/orkes_linux_arm64"
      sha256 "ef9393487947ad956bb9945fe74ebf75d4e6ac84a057b1eca29a924ad124b7b1"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.31/orkes_linux_amd64"
      sha256 "813d7a94e3df8bff2f0ec05bdb4e3aff050fd37ad7b4b502f107d17d91a30515"
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
