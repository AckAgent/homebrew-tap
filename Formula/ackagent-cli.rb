class AckagentCli < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"
  version "0.0.32"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "b9417746169b097f738dbe85c9df610c69e42e922ae81960903b4015015e3ecb" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "b9417746169b097f738dbe85c9df610c69e42e922ae81960903b4015015e3ecb" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "7d43813234e0b093f32b3cc208d9af407f3b0a594f19b955151c411f9e27bb60" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "2d8e570e9ebdd6fd9b899c34e68d7d402924936eb13cee808d7a633da6737b79" # linux-amd64
    end
  end

  def install
    bin.install "ackagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ackagent --version")
  end
end
