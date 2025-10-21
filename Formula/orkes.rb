class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.27/orkes_darwin_arm64"
      sha256 "55d05d7e4552bf87be34a93efa8db7f7199b4ea87d4a0d9e0409f4093156a6b5"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.27/orkes_darwin_amd64"
      sha256 "a357f4e2aa860028b05954d1a10883299ff8df53be21fdac49989ff60990d0ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.27/orkes_linux_arm64"
      sha256 "15c8fd086b4d42f1e0a97bea4cb4e98d978415ea09589620a351d21faca4e94a"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.27/orkes_linux_amd64"
      sha256 "4e2a8df1a2a7695fa6a24ad781e41a14bd042668b1429a78185d155ad9a990e2"
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
