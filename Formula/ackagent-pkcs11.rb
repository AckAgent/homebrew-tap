class AckagentPkcs11 < Formula
  desc "SSH PKCS#11 provider for AckAgent (hardware keys)"
  homepage "https://ackagent.com"
  version "0.0.30"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "0da1fbbab429faa7ebced6678b0799f72b6462c58da74990075cb4f325810e0d" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-darwin-arm64.tar.gz"
      sha256 "0da1fbbab429faa7ebced6678b0799f72b6462c58da74990075cb4f325810e0d" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-linux-arm64.tar.gz"
      sha256 "e75efe21b2882cb98c5014b6c290feb5c2a504dc1e8abf4fe099285250edf079" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-linux-amd64.tar.gz"
      sha256 "510e0518ed23f71cd5122b19c87bc91773d9c8dc50fb12e9d3a221939d852b99" # linux-amd64
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
