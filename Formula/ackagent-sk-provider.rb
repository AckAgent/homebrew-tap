class AckagentSkProvider < Formula
  desc "SSH SecurityKeyProvider for AckAgent (software keys)"
  homepage "https://ackagent.com"
  version "0.0.32"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "3fb2078716232611909398c1ff7941bce0bfdf57cc26a7ec980a3730d76d5b9f" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-darwin-arm64.tar.gz"
      sha256 "3fb2078716232611909398c1ff7941bce0bfdf57cc26a7ec980a3730d76d5b9f" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-linux-arm64.tar.gz"
      sha256 "62a0ead544ad8ac0ddc2517e2254a136c4799f47a0472c19ec764b90ac67e463" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-linux-amd64.tar.gz"
      sha256 "57a19d38a62bea799cf4770065b34d785ac5304d477969a8f32065715b2c5a37" # linux-amd64
    end
  end

  def install
    if OS.mac?
      lib.install "libackagent-sk.dylib"
    else
      lib.install "libackagent-sk.so"
    end
  end

  def caveats
    <<~EOS
      To use the SSH SecurityKeyProvider, add to ~/.ssh/config:
        SecurityKeyProvider #{opt_lib}/libackagent-sk.#{OS.mac? ? "dylib" : "so"}
    EOS
  end

  test do
    lib_ext = OS.mac? ? "dylib" : "so"
    assert_predicate lib/"libackagent-sk.#{lib_ext}", :exist?
  end
end
