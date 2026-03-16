class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.1/conductor_darwin_arm64"
      sha256 "d588e95af8cae22510d15f71b56b4ebb7c4876306c8a485728b12a58b5f0609e"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.1/conductor_darwin_amd64"
      sha256 "93a9392288d0fd12cce77f657ca9d2cb1854920971b819fa8e499dd0dc29cd75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.1/conductor_linux_arm64"
      sha256 "8c843c8e913dbc4dff82303b818bef46f97c03c4e8e9238f2493d64e2e162f6b"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.1/conductor_linux_amd64"
      sha256 "6f1db36200b5c6db29e1ca8ef4b8ad371993d0aa6e123de21212bce3bd226525"
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
