class Ackagent < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://github.com/ackagent/ackagent"
  version "0.0.20"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "4e3ef6a967dfc75762dd4ada17391193f30744a91f522177b519a9611b828e79" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "9c27b40ecebcd5bd1326ab999bc140cadb9d682b64c69becb125ea133f2c5c83" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "2bb119eb0cb9ebab6a236be7d8ae6d7fd46eeff7b20b38938524f2d878a77de0" # linux-amd64
    end
  end

  def install
    bin.install "ackagent"
    if OS.mac?
      lib.install "libackagent-sk.dylib"
    else
      lib.install "libackagent-sk.so"
    end
  end

  def caveats
    <<~EOS
      To use the SSH SecurityKeyProvider, add to ~/.ssh/config:
        SecurityKeyProvider #{opt_lib}/libackagent-sk.#{OS.mac? ? "dylib" : "so"}

      Run `ackagent login` to authenticate before using other commands.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ackagent --version")
  end
end
