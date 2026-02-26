class AckagentSkProvider < Formula
  desc "SSH SecurityKeyProvider for AckAgent (software keys)"
  homepage "https://ackagent.com"
  version "0.0.33"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "8f594f2ebf9fabf9cd5fac950e429275d5223c0fc913e893ae0b299a26af87f3" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-darwin-arm64.tar.gz"
      sha256 "8f594f2ebf9fabf9cd5fac950e429275d5223c0fc913e893ae0b299a26af87f3" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-linux-arm64.tar.gz"
      sha256 "8934a0b635649571028eaab547e88cbb39eb7156b3c949670514adfc202b4a43" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-linux-amd64.tar.gz"
      sha256 "f3034c842f04cbe7e062f320a4338ece87efde06e637a13430c7090441ab7dc9" # linux-amd64
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
