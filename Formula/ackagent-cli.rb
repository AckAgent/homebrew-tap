class AckagentCli < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"
  version "0.0.38"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "60928c0db9abfa22c34b9fc52a09b502ee0d4b89d88610a2e75c75e3616c8005" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "60928c0db9abfa22c34b9fc52a09b502ee0d4b89d88610a2e75c75e3616c8005" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "64cf15aa1fddfd59b4e293423a2f7f28aac4a02bce10a5dc3df606ecf2fb44d3" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "f023bea42420da8bd71dc9e5c06dc021135cc046f02cd5f0088068a3dec09b25" # linux-amd64
    end
  end

  def install
    bin.install "ackagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ackagent --version")
  end
end
