class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.3/conductor_darwin_arm64"
      sha256 "2b85e16e71631bebd1f6a9b7ee1e33d55b743bad661a26fc0dd10066559a0b4a"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.3/conductor_darwin_amd64"
      sha256 "e0cc8f5b0faac4286d8c31cd7edb0badc4ac31a4432827a527531c5cbffeb700"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.3/conductor_linux_arm64"
      sha256 "f6ef01f7481a5bf99ea41c42c204a9819e9d3f802b2ae14e43a65ce214849d6f"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.3/conductor_linux_amd64"
      sha256 "6f300fe09b9e7c17ddfdaa7e965d054603d5a5a54e04230d5a7eb2a3439b7e44"
    end
  end

  def install
    bin.install "conductor_darwin_arm64" => "conductor" if Hardware::CPU.arm? && OS.mac?
    bin.install "conductor_darwin_amd64" => "conductor" if Hardware::CPU.intel? && OS.mac?
    bin.install "conductor_linux_arm64" => "conductor" if Hardware::CPU.arm? && OS.linux?
    bin.install "conductor_linux_amd64" => "conductor" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    system "#{bin}/conductor", "--version"
  end
end
