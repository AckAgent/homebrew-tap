class AckagentCli < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"
  version "0.0.37"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "b4e9f70ee0552a1d095922d5dea9c955d2698286bccbdaf3415d898cb0dda0cc" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "b4e9f70ee0552a1d095922d5dea9c955d2698286bccbdaf3415d898cb0dda0cc" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "975ec4cefc6dd1c51411ee11cdd3ffc11d37f51608542b00cc7d2f9fe216d92a" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "0eead834303073af486f493ca7e568fa71f166e178afa3139c03e0743126867f" # linux-amd64
    end
  end

  def install
    bin.install "ackagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ackagent --version")
  end
end
