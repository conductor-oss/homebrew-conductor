class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.35"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.35/orkes_darwin_arm64"
      sha256 "9764afd619d609fd0c4b96788295d2a408e0196785cd0af35efe3735ce92cccb"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.35/orkes_darwin_amd64"
      sha256 "547cc8064e2dcc96c846450bd689352200eefb0dc3dc7e05dbc0505d49e6c7a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.35/orkes_linux_arm64"
      sha256 "7359b4b06a94bcae4ce09276e4f58bd38f90a237886b973ab22f2d874ab6fa2e"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.35/orkes_linux_amd64"
      sha256 "b2dce82d40578b79bcc910031a9f8dc93fcf1d3046c994ad24bea0643611c257"
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
