class AckagentCli < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"
  version "0.0.36"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "02d14f07d3087aa9eaefe854a9b3a32787c10dcc7cc0eadf20682f9c7ec5895b" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "02d14f07d3087aa9eaefe854a9b3a32787c10dcc7cc0eadf20682f9c7ec5895b" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "63ff60137015f3b721fec8b55fe68fc225bc4e7fe7ce44538eaff0967b0a9f19" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "a67097e4b961c17c7ec589bb8ce2709a0228c014ff382f368bcdf235c1a4647f" # linux-amd64
    end
  end

  def install
    bin.install "ackagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ackagent --version")
  end
end
