class AckagentAgePlugin < Formula
  desc "Age encryption plugin for AckAgent"
  homepage "https://ackagent.com"
  version "0.0.32"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "3457ec2ada982e850a5fa30791e10df6fd116a186769f7d8dc21e404fd93e462" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-darwin-arm64.tar.gz"
      sha256 "3457ec2ada982e850a5fa30791e10df6fd116a186769f7d8dc21e404fd93e462" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-arm64.tar.gz"
      sha256 "bc208cd1d9a856c3aa25d4ec0a7a7948009ef52cc931db8fd90326a7fe98a268" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-amd64.tar.gz"
      sha256 "886f5928f4c59fd23850d27bc285d649fb396c08772d0c754538fd081035d23c" # linux-amd64
    end
  end

  def install
    bin.install "age-plugin-ackagent"
  end

  test do
    assert_predicate bin/"age-plugin-ackagent", :exist?
  end
end
