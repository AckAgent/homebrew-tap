class AckagentPkcs11 < Formula
  desc "SSH PKCS#11 provider for AckAgent (hardware keys)"
  homepage "https://ackagent.com"
  version "0.0.25"
  license :cannot_represent

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-darwin-arm64.tar.gz"
      sha256 "3e5a6e4b2e6981a0fae370cf329d4dee9fccafde66455f2bd2261941b0992594" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-linux-arm64.tar.gz"
      sha256 "04ba9c8224485c88a7f619d9a0c4000632842cd9d824681571ad40c10433fa49" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-linux-amd64.tar.gz"
      sha256 "d5b77a7492519ee851451bae6e231ae98a03fc82d50936f84d1228dc4ab265a3" # linux-amd64
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
