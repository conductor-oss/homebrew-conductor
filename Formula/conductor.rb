class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.2/conductor_darwin_arm64"
      sha256 "6bf61f917796999dee486c4d4ed4390601d3d17928e8409c729940df3b549207"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.2/conductor_darwin_amd64"
      sha256 "30f52dd2fb390bb2ec907e1f9f5e01370edd3604b618dbcf3fa21794b6c24aa2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.2/conductor_linux_arm64"
      sha256 "1441a338f16d8a12cc838c6a7f283b89b98feec5aeb52cb846145436cfe4adb2"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.2/conductor_linux_amd64"
      sha256 "4dd8da41320c170dd84f87f20a6d11621ca44b3b9add569dad2b316e7b237950"
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
