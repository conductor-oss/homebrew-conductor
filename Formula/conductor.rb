class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.6/conductor_darwin_arm64"
      sha256 "c89c89dad8c9c025203966abb55effb08171af83bf5c74cb8e4bd6ca61e9736d"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.6/conductor_darwin_amd64"
      sha256 "d34680dac533b124570b2136d665b7f418594636bf2148487459ec03a331cccc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.6/conductor_linux_arm64"
      sha256 "d903473a97d25f58a7ae6eaba5c1c2ec89a750bc01edefbe3b6088c78c523393"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.6/conductor_linux_amd64"
      sha256 "e89b79734b928b118329de712e1855509b24bb58e870873dc9b3f2712483feb4"
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
