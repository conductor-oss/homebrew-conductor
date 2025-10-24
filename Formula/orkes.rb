class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.29/orkes_darwin_arm64"
      sha256 "140a06fffff4560b077b468c860d58b19cc2191fead90912d230de322824a1e3"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.29/orkes_darwin_amd64"
      sha256 "1d01f758be4851cf415b3b7a5c180e9bc1eefdd01daf6ca0975cf593af3f84c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.29/orkes_linux_arm64"
      sha256 "435b3f97c271a3559000a49997f63b63a46b08b347e6740e54fdd8c9996cdbd9"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.29/orkes_linux_amd64"
      sha256 "a39440f921f32ac4642fc2e305dbd5824559d413d07f1d4be03a68076ef965b1"
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
