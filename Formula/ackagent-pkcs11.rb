class AckagentPkcs11 < Formula
  desc "SSH PKCS#11 provider for AckAgent (hardware keys)"
  homepage "https://ackagent.com"
  version "0.0.43"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "5191f4c2163b9cdefa496c2a31aa2d9bb7243671fa46da99e0388dbdbeb944db" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-darwin-arm64.tar.gz"
      sha256 "5191f4c2163b9cdefa496c2a31aa2d9bb7243671fa46da99e0388dbdbeb944db" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-linux-arm64.tar.gz"
      sha256 "bea1ff9f13dd0806b1a63fe45fc691ecf33ec8e8c71bdc6fb27993627cc1fbcd" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-linux-amd64.tar.gz"
      sha256 "a7fddfeb0da240daf74a4959758840a1f519f0c55b07e604f2494a821bb8f57e" # linux-amd64
    end
  end

  def install
    if OS.mac?
      lib.install "libackagent-pkcs11.dylib"
    else
      lib.install "libackagent-pkcs11.so"
    end
  end

  def caveats
    <<~EOS
      To use the SSH PKCS#11 provider, add to ~/.ssh/config:
        PKCS11Provider #{opt_lib}/libackagent-pkcs11.#{OS.mac? ? "dylib" : "so"}
    EOS
  end

  test do
    lib_ext = OS.mac? ? "dylib" : "so"
    assert_predicate lib/"libackagent-pkcs11.#{lib_ext}", :exist?
  end
end
