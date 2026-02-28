class AckagentCli < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"
  version "0.0.39"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "f25642b31c8655a3ac170a395c5e9f503fdd34842ee816be12aaee0d6f99e35b" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "f25642b31c8655a3ac170a395c5e9f503fdd34842ee816be12aaee0d6f99e35b" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "f7b2a9fb53fbf69f3d95db3f24dd26b365ff252c12324fcddc6a95204c566448" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "3b68227298028ac5b7ae9405297d0432aa07e0e59aa15815b8846e7ffbe0c9d6" # linux-amd64
    end
  end

  def install
    bin.install "ackagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ackagent --version")
  end
end
