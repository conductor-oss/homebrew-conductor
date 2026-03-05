class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.48"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.48/conductor_darwin_arm64"
      sha256 "bb40d8c3f2da024902b625acf736f5f59fcad110617193d161bd182319b0afbf"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.48/conductor_darwin_amd64"
      sha256 "c89af107bed93ede26872a20a464eb747de6d320c276c62a6b143ed0c8fc0f59"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.48/conductor_linux_arm64"
      sha256 "92ec51a68f997ce409ed34b945ca9dd68055c459e703fd13d7a03122786f7865"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.48/conductor_linux_amd64"
      sha256 "69a0c686e1155272da5e1520e30e9877f4e440da86e62a9de913752ec2103cbe"
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
