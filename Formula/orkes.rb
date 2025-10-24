class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.32/orkes_darwin_arm64"
      sha256 "b40fd70ed21bf01f1dff5ecee651e7583c1d4581a97c2681987d4419ae0d8411"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.32/orkes_darwin_amd64"
      sha256 "a1a6eddc1fdab9a4e3fda7a80f14029390b83366a60575e191f6a69b99ea89a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.32/orkes_linux_arm64"
      sha256 "dda35333ed80a9637f170aa3a03dc58caf61c35fffb79ab0004e6a1ab108d475"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.32/orkes_linux_amd64"
      sha256 "619fc20060b37de379f16c967bf1352b49c9fb21ff35358d6e2c835288a07063"
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
