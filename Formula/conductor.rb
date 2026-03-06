class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.49"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.49/conductor_darwin_arm64"
      sha256 "3f2e91a5760bef5deac6a2eac5f1032f33fc2896579fd1c3e873598b399739d8"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.49/conductor_darwin_amd64"
      sha256 "646c6f981a8049f1cea2f4406fa32dfd4dd1d4b78bcd6e339a41a7df39616cbc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.49/conductor_linux_arm64"
      sha256 "6c0ef5f1e550eec4c70fec34aa734ec32f2242b5b294d7d0261a039d604cc54b"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.49/conductor_linux_amd64"
      sha256 "409b0152646932889a3c0c9eda33a362a68e3bc67620119cb4c369224a93f7d3"
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
