class Ackagent < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing (all components)"
  homepage "https://ackagent.com"
  version "0.0.43"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "20b0ee73f1e7431ca84faf8cc037d224ab03c44e75d439966072f1e4cee28d2c" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "20b0ee73f1e7431ca84faf8cc037d224ab03c44e75d439966072f1e4cee28d2c" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "530fe1bd2d372ef68f3c799c685277e4ef7e46b8914244b28c6cd913abcc84c0" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "543a6b8ec1baa9139c0333fd3fe9b30253a966e39dadb1264c332d153ff85e7d" # linux-amd64
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
