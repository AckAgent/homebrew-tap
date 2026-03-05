class AckagentAgePlugin < Formula
  desc "Age encryption plugin for AckAgent"
  homepage "https://ackagent.com"
  version "0.0.43"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "384066d136f3c6b44c5e5f84fae3399f0ca54e1e27a6c7ce9b2d9d7a9195810e" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-darwin-arm64.tar.gz"
      sha256 "384066d136f3c6b44c5e5f84fae3399f0ca54e1e27a6c7ce9b2d9d7a9195810e" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-arm64.tar.gz"
      sha256 "d8c21868fac4f3167904cdb54ae7a46038455c8fd6319a05f148a66e30823368" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-amd64.tar.gz"
      sha256 "673612ec8dabfbcc53aea0709ce59c27bac277b9ad2b38d856e1c30475688888" # linux-amd64
    end
  end

  def install
    bin.install "age-plugin-ackagent"
  end

  test do
    assert_predicate bin/"age-plugin-ackagent", :exist?
  end
end
