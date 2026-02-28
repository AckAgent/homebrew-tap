class AckagentSkProvider < Formula
  desc "SSH SecurityKeyProvider for AckAgent (software keys)"
  homepage "https://ackagent.com"
  version "0.0.38"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "720f00a72672f745194e95a39f773f65a0e31988bcf9403caeeda89a69c66b83" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-darwin-arm64.tar.gz"
      sha256 "720f00a72672f745194e95a39f773f65a0e31988bcf9403caeeda89a69c66b83" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-linux-arm64.tar.gz"
      sha256 "a0e7a3cc64ead73bdd4474b706b7e3347bb0e1494d140741d254d741fd789039" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-linux-amd64.tar.gz"
      sha256 "4b59417c9674bde4c7a01d370dabe8231c6734d33e0f1eddcd6ef8949b9e4884" # linux-amd64
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
