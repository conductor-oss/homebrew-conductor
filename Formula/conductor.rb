class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.0/conductor_darwin_arm64"
      sha256 "4cd4c4d0b413104e5439c9d4bbea8138b7631132a7635509fff64dc119a0fb3a"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.0/conductor_darwin_amd64"
      sha256 "6fb68a5a7fb92931bfae6f4679252ff9e777c0ad1b05a627bdc817894fb0c735"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.0/conductor_linux_arm64"
      sha256 "11c5fe21dc585dff661da121cf5aee903b14619614ea8d1485052839c6065897"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.0/conductor_linux_amd64"
      sha256 "a4da9e1ac919bcde833270bf79de2da604326cb3963581cc7ae8433b1091c48d"
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
