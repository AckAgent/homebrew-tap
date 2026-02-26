class AckagentAgePlugin < Formula
  desc "Age encryption plugin for AckAgent"
  homepage "https://ackagent.com"
  version "0.0.33"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "fb65123bd1bb54419db6cb75bb977a4fe4c417b8d6b1ba527063141458647fc0" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-darwin-arm64.tar.gz"
      sha256 "fb65123bd1bb54419db6cb75bb977a4fe4c417b8d6b1ba527063141458647fc0" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-arm64.tar.gz"
      sha256 "21bb81380bb15cfedb79a77d1cb9d3d8c84e856c5be8ce910b985142d7cf87e7" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-amd64.tar.gz"
      sha256 "b7de62ab13065957bf341fe762b0f6000f9bd4f0ea1e59e9bc92a43f29453837" # linux-amd64
    end
  end

  def install
    bin.install "age-plugin-ackagent"
  end

  test do
    assert_predicate bin/"age-plugin-ackagent", :exist?
  end
end
