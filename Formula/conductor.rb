class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.50"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.50/conductor_darwin_arm64"
      sha256 "4dfb470845240cc0106a95ce97c5f5f59a87868c3eb65fce7ff432ce59c8ad69"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.50/conductor_darwin_amd64"
      sha256 "2d5b16313cf8596c16047409f1fefbde24796643df5388820ce090d113576919"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.50/conductor_linux_arm64"
      sha256 "d33d22b9a63b21baf8c74ffe643809992d0c365a3d725b32adc598571466a0b6"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.50/conductor_linux_amd64"
      sha256 "b764195b77a612523ba7d976d5c1cbfa7e1cd5f18b4b33340ebc526d0cdaaf86"
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
