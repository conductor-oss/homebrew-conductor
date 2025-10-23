class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.28/orkes_darwin_arm64"
      sha256 "dd85470138a1e6d653ad44ad935ccbb896542faa903a1ad8ba5a01de8620c9f2"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.28/orkes_darwin_amd64"
      sha256 "a684e285cf7ab18e25cd653de0bd3c2d93b3c02de5e12a2b9c40af4a5d59870b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.28/orkes_linux_arm64"
      sha256 "33df85c1cb0195c9d9b316cb8bb3ec1ca452540fdfe1b6c63cf62cdc34c98efd"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.28/orkes_linux_amd64"
      sha256 "0bc33583297b70c94a8b09ba74851df77001568fb3d10a05fd311bf61a0551da"
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
