class AckagentCli < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"
  version "0.0.40"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "5fe5a86f58856481ee521004133390bb3d736d6221fb3f95f92ecc6cb2047345" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "5fe5a86f58856481ee521004133390bb3d736d6221fb3f95f92ecc6cb2047345" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "afff46c6ec9177041043ec38939c0e86f52ab0c271a37e0d64d968607d31ffdd" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "8a2eb144e72c08fb7e967ada3e59df1910128cdbcf7578408fc9c8be6e9ded11" # linux-amd64
    end
  end

  def install
    bin.install "ackagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ackagent --version")
  end
end
