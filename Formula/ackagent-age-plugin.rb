class AckagentAgePlugin < Formula
  desc "Age encryption plugin for AckAgent"
  homepage "https://ackagent.com"
  version "0.0.42"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "6400a596377afc26be6cd1dc62b99123c45fd3f0a4bf3dc6d9d456f6006ffdf7" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-darwin-arm64.tar.gz"
      sha256 "6400a596377afc26be6cd1dc62b99123c45fd3f0a4bf3dc6d9d456f6006ffdf7" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-arm64.tar.gz"
      sha256 "86c41c0de4a8aec97da84fd6e1d31cd485d3231b4c1762d9dc2ccdaf63a10cf9" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-amd64.tar.gz"
      sha256 "e1ad59c3af49df5b9b26c6d76458567aece32241d36aa787b83d382c91b4fafa" # linux-amd64
    end
  end

  def install
    bin.install "age-plugin-ackagent"
  end

  test do
    assert_predicate bin/"age-plugin-ackagent", :exist?
  end
end
