class Ackagent < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing (all components)"
  homepage "https://ackagent.com"
  version "0.0.24"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "ce8f266a4ebd268ac4b0d848d77a216eb4260ae6aa3e4bb63224ae77ac084d6b" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "5a2b016ce3fd11124fdfea9e2b25c9f8547ac4a59dad12081395a0dd79f7684e" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "e9f10c52dcc868803f8d19305ffcaa1186c5a1af96a632a3c150cbe571b662d8" # linux-amd64
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
