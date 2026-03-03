class AckagentAgePlugin < Formula
  desc "Age encryption plugin for AckAgent"
  homepage "https://ackagent.com"
  version "0.0.41"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "e339d2b38d9dec733e96c878a03f1b7dcc7bd24e7e6190f32c5b44295c5d8361" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-darwin-arm64.tar.gz"
      sha256 "e339d2b38d9dec733e96c878a03f1b7dcc7bd24e7e6190f32c5b44295c5d8361" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-arm64.tar.gz"
      sha256 "1e62bc133b4d83e5e6a7b7945b7a3437a6882bb5e1c4d354ec9f5e5a1dfa403d" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-amd64.tar.gz"
      sha256 "fe537ee47ef1b4d8e6e6afa67da79b3c75296dae90e4d837f4cfbabff100d74d" # linux-amd64
    end
  end

  def install
    bin.install "age-plugin-ackagent"
  end

  test do
    assert_predicate bin/"age-plugin-ackagent", :exist?
  end
end
