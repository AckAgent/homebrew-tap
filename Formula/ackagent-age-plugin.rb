class AckagentAgePlugin < Formula
  desc "Age encryption plugin for AckAgent"
  homepage "https://ackagent.com"
  version "0.0.31"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "9147bc75f95f397188bf45c869b347c0bcbe4c5e9d537a599e6ca114c9d78fa9" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-darwin-arm64.tar.gz"
      sha256 "9147bc75f95f397188bf45c869b347c0bcbe4c5e9d537a599e6ca114c9d78fa9" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-arm64.tar.gz"
      sha256 "129df71ca891202b57e1e5bbf48baf2e7e7167917330261f5fcd088ec0fe2375" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-amd64.tar.gz"
      sha256 "1b75c4f87738b7c3b32fad49648abae947d95f07ef8f4b7b13748232b412a8cb" # linux-amd64
    end
  end

  def install
    bin.install "age-plugin-ackagent"
  end

  test do
    assert_predicate bin/"age-plugin-ackagent", :exist?
  end
end
