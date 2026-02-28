class AckagentAgePlugin < Formula
  desc "Age encryption plugin for AckAgent"
  homepage "https://ackagent.com"
  version "0.0.40"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "d6a2274dbda1c7ef4b06059269d0723aa26f9aec8a0c002136a52dc152f9d005" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-darwin-arm64.tar.gz"
      sha256 "d6a2274dbda1c7ef4b06059269d0723aa26f9aec8a0c002136a52dc152f9d005" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-arm64.tar.gz"
      sha256 "cd8742e3f20193c09abd260e3a1e12647e37fa1eebb62eb4d1571c14710ecc88" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-amd64.tar.gz"
      sha256 "5121d850aa120e7a74cc00df33266770eb1530b96f35fd26842ee74427cf95cb" # linux-amd64
    end
  end

  def install
    bin.install "age-plugin-ackagent"
  end

  test do
    assert_predicate bin/"age-plugin-ackagent", :exist?
  end
end
