class Ackagent < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing (all components)"
  homepage "https://ackagent.com"
  version "0.0.25"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "c06e90f8891024d29e8cf01a2d9fb7ed330689cb765096bf7848f1c4035d04a8" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "c66917371b89d45710171b6af3e9c7c1e77747ee33a5c1c7ece9145101c6bd65" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "65f8b2448057e2623d740cdb2141939b63d451a5eca0b27b8f4b19dde0a78d19" # linux-amd64
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
