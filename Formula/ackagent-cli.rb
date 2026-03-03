class AckagentCli < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"
  version "0.0.42"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "717dc7b28af8c4258963cbeb6f8d0719978b0184dc3e2aff90ebb283e81f63e9" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "717dc7b28af8c4258963cbeb6f8d0719978b0184dc3e2aff90ebb283e81f63e9" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "ad1b5f94fa356cb87e673df8ba6418bda4b8934373e0dac1a776545ef6c9c978" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "4e659a2dd94ddaa1e54f1ecfc9cfd1f011f437f87fbee2f060e17c08f83f2841" # linux-amd64
    end
  end

  def install
    bin.install "ackagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ackagent --version")
  end
end
