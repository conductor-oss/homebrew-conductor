class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.46"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.46/conductor_darwin_arm64"
      sha256 "1c81382c83075817db1762d963f4cc79b9997c92896ee7b17eccf77f4f1adf1c"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.46/conductor_darwin_amd64"
      sha256 "4a32d7e63696786dad3730634a590b187932529359a1e1655cc76f37d201e5b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.46/conductor_linux_arm64"
      sha256 "35f8e2613f007453bb3f13e1b0d46aaa044a05b610df8bb166ef66092f0436e2"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.46/conductor_linux_amd64"
      sha256 "d8f63f81ae95ea745e3fc0a2fd4bc717bf4eb9852aaaa83bb165723f98e30362"
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
