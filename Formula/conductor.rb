class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.5/conductor_darwin_arm64"
      sha256 "5be2213e4c67060dee27323e74a805bf587a5ce286ce96916186e8e365a40707"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.5/conductor_darwin_amd64"
      sha256 "7230869bea1fb95f74eb0f129aa386e9f21c67f6b1b1caa7c82a264d4fcdd05a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.5/conductor_linux_arm64"
      sha256 "8331a392e8a7eb7ffe42a3ed0663822b05402a2579e025670a37f10b4448e6e6"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.5/conductor_linux_amd64"
      sha256 "414666225308e5471f30bb1ceba2b16f23d5aa7f603596f3e55812fcc9232720"
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
