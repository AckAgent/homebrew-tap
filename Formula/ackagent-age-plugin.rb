class AckagentAgePlugin < Formula
  desc "Age encryption plugin for AckAgent"
  homepage "https://ackagent.com"
  version "0.0.38"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "a0992850173590a3f14c13d758971b4e44c6cd9eb68498a998ea38a0eeea318d" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-darwin-arm64.tar.gz"
      sha256 "a0992850173590a3f14c13d758971b4e44c6cd9eb68498a998ea38a0eeea318d" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-arm64.tar.gz"
      sha256 "29c5ff46984c23b531916331659a1503adac1ceaa9afb473d7b1bf324535313c" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-amd64.tar.gz"
      sha256 "ddfd8f27158f4d08656e316ffbc268892d9ae49ce0ed0df9899baf7ebb9e2885" # linux-amd64
    end
  end

  def install
    bin.install "age-plugin-ackagent"
  end

  test do
    assert_predicate bin/"age-plugin-ackagent", :exist?
  end
end
