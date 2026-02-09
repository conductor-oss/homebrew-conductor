class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.47"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.47/conductor_darwin_arm64"
      sha256 "4fb08ae942362d99ec46bcfabc239bc02955c21fab0e7cfbb846c4a358ce015f"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.47/conductor_darwin_amd64"
      sha256 "1dfe26b54c05ba1e77ec1b23f84d967d4558de9e64e4122371452969ea3deafa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.47/conductor_linux_arm64"
      sha256 "c48f5967e81c54c5bf9accb58167044c46043db6d4a3a8650b14d5b8a8cfb160"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.47/conductor_linux_amd64"
      sha256 "48ca2158b4c09f91d9aadb26e0a54824a0d319d6e95e6d120c5a11b8167eeed3"
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
