class AckagentAgePlugin < Formula
  desc "Age encryption plugin for AckAgent"
  homepage "https://ackagent.com"
  version "0.0.28"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "a6c95c122dd9e643c8fe048375c8323795a7094fae04b9dfff9b5b15e6e674e1" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-darwin-arm64.tar.gz"
      sha256 "a6c95c122dd9e643c8fe048375c8323795a7094fae04b9dfff9b5b15e6e674e1" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-arm64.tar.gz"
      sha256 "ab343ac3776329a01bb4cfa784f91319bcc6c207b6cbc88a11863df0893f826b" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-amd64.tar.gz"
      sha256 "45a48b83a3ab8688cd37082708f834c57cd1bd643125f7e934f2a84bfa1465f7" # linux-amd64
    end
  end

  def install
    bin.install "age-plugin-ackagent"
  end

  test do
    assert_predicate bin/"age-plugin-ackagent", :exist?
  end
end
