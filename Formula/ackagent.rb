class Ackagent < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing (all components)"
  homepage "https://ackagent.com"
  version "0.0.34"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "1502790a3a8755517f1438da2dac3d25f443f0bbb4319d70a3f097f668c657cb" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "1502790a3a8755517f1438da2dac3d25f443f0bbb4319d70a3f097f668c657cb" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "4cd281f3f5a3723d0612dddc46d7df18fa217f4cd38ea21a28c68e3289b06b78" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "4a712160297d79b7498fe7d4e95712cac745e34c575a0a57b655da18b22e8909" # linux-amd64
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
