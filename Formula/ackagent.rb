class Ackagent < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing (all components)"
  homepage "https://ackagent.com"
  version "0.0.31"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "c5349d45771f8fe82efe0436cef19790294eb3817bfb5801290227784f100f71" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "c5349d45771f8fe82efe0436cef19790294eb3817bfb5801290227784f100f71" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "27379d44dfd14113a98a9c82f6f7609ad21686dcf99fde9be432a4f1eb7df23b" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "d827efb761c3ca993602c3533d2a64e3fd76a7e8c8f0469e136e60cebc1e9ada" # linux-amd64
    end
  end

  depends_on "ackagent/tap/ackagent-cli"
  depends_on "ackagent/tap/ackagent-sk-provider"
  depends_on "ackagent/tap/ackagent-pkcs11"
  depends_on "ackagent/tap/ackagent-age-plugin"

  def install
    doc.install "NOTICES"
  end

  test do
    assert_match version.to_s, shell_output("#{HOMEBREW_PREFIX}/bin/ackagent --version")
  end
end
