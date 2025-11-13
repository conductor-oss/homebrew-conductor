class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.36"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.36/orkes_darwin_arm64"
      sha256 "04fdeded5ea33e05885d977382d5f2b35aa093b361ea77a002d599535b9c587b"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.36/orkes_darwin_amd64"
      sha256 "69568e24dda5df8c8b9e789c2123d9dde3125517965fea4c29d6d9a12e2552d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.36/orkes_linux_arm64"
      sha256 "1a49e6a24cd87901e58d49fa20acfe3e5db4a5d95f2f2ddd0b44415c342a5d80"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.36/orkes_linux_amd64"
      sha256 "b378f422420f11af6c54ab7ec07a33aeba7d5214f65fe35b3a2de0cce913620f"
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
