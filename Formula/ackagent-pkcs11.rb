class AckagentPkcs11 < Formula
  desc "SSH PKCS#11 provider for AckAgent (hardware keys)"
  homepage "https://ackagent.com"
  version "0.0.22"
  license :cannot_represent

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-darwin-arm64.tar.gz"
      sha256 "6e946d8dcc7cbc4d9b04a135906b05461ff64a3bbf5403b4b22ccd9b61139a30" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-linux-arm64.tar.gz"
      sha256 "16ef7b21f8f17be6946c9b406f6fccbb48b576d5c6b3ffa19ecb454a47ba1a92" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-linux-amd64.tar.gz"
      sha256 "24038f3f32aecdcfbfe0e43138c7a7d76978aee95a3b9a1d67bc4f46844c2bcc" # linux-amd64
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
