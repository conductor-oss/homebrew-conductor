class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.25/orkes_darwin_arm64"
      sha256 "5b8b3ffc1d52726f555c91136799ef8304ed3c106350d8fad78a4d8991fa141e"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.25/orkes_darwin_amd64"
      sha256 "43805d67993095600807c6a2cb6cc73da112ccacb4605bdb9bf45d2c44ac9929"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.25/orkes_linux_arm64"
      sha256 "e0dd6cfe7bdf31d90358785be18d5c2c4718f1912e76c4c467ab2bb6ccdb0e1c"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.25/orkes_linux_amd64"
      sha256 "5089fa8da3021f382b097a098d187774835eca8e6958851bbd1c1cd338c4a00b"
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
