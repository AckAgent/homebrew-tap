class AckagentAgePlugin < Formula
  desc "Age encryption plugin for AckAgent"
  homepage "https://ackagent.com"
  version "0.0.29"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "286c666d0cd079ab01d01b6196b49f8bf6e397f1e4c14a7e137029ffba937228" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-darwin-arm64.tar.gz"
      sha256 "286c666d0cd079ab01d01b6196b49f8bf6e397f1e4c14a7e137029ffba937228" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-arm64.tar.gz"
      sha256 "bd5ae859f4c94019661288e4854c8affab8c6b1f78b92fabfe76f9d922e28e14" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-amd64.tar.gz"
      sha256 "418d49343d09fbd0a83af514d401564237cf6b5fe5bc401c21fe973a7dae6864" # linux-amd64
    end
  end

  def install
    bin.install "age-plugin-ackagent"
  end

  test do
    assert_predicate bin/"age-plugin-ackagent", :exist?
  end
end
