class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.30/orkes_darwin_arm64"
      sha256 "e8f115c61ad9ca57a9c263e0437778ad717e2417068bdc6ffc7289e37d85348d"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.30/orkes_darwin_amd64"
      sha256 "406eb2a4cfa6fc6987695695ac0973edfe91cc8117966d9a10051973b13439a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.30/orkes_linux_arm64"
      sha256 "f4b2bb5c8f1aeff6578b816170385b4e8aa53de79a88e9f1b7ed96cbad153271"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.30/orkes_linux_amd64"
      sha256 "9f9ce8b63d5829c30f7887c7c0b15a4a60ea816d528526ae30add316c5539b18"
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
