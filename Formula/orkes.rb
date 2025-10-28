class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.34/orkes_darwin_arm64"
      sha256 "217d49b028c94dec20dd84c946a50bdc7cd1bc55dcfc5e2338d741dc83e747de"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.34/orkes_darwin_amd64"
      sha256 "d31ce7c7c920a9dc789d4310543ec950345826e24e063b66b45c36167b349382"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.34/orkes_linux_arm64"
      sha256 "27ddfa25f65a8bc1a73d15d802d3a911b158dd459c4c37af5f0bedf5151ab28e"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.34/orkes_linux_amd64"
      sha256 "3d000ecd23429dbe5c6a4b6cbeb18dcc74293b67a87dd669e2972a086e581851"
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
