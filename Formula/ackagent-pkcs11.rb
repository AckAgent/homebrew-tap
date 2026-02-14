class AckagentPkcs11 < Formula
  desc "SSH PKCS#11 provider for AckAgent (hardware keys)"
  homepage "https://ackagent.com"
  version "0.0.29"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "a6fd586a0152f3386e9e8f8bb9df40d8eac8952415eed76d964dc3ea06ed11da" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-darwin-arm64.tar.gz"
      sha256 "a6fd586a0152f3386e9e8f8bb9df40d8eac8952415eed76d964dc3ea06ed11da" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-linux-arm64.tar.gz"
      sha256 "dab656adb5dd59cfc544e23a645c53019aa8804d770881a7b505ec63e1145519" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-pkcs11-v#{version}-linux-amd64.tar.gz"
      sha256 "74e6acec7c06dae0ddff404182035fe5f60ef77393bd28b267b8e1ee30958afd" # linux-amd64
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
