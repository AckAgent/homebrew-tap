class AckagentSkProvider < Formula
  desc "SSH SecurityKeyProvider for AckAgent (software keys)"
  homepage "https://ackagent.com"
  version "0.0.42"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "bf8031c1d99eaf7ad6000c6f0efc6924957d4e73cf752f351c284d3d7c110ac6" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-darwin-arm64.tar.gz"
      sha256 "bf8031c1d99eaf7ad6000c6f0efc6924957d4e73cf752f351c284d3d7c110ac6" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-linux-arm64.tar.gz"
      sha256 "42c9b67e4d3e20ad82f7d1fccaa803ffcf1d1a92b4ec46b8002b814e2faec722" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-linux-amd64.tar.gz"
      sha256 "37ffcfe18de87a7985bef0c9f901b25b7d597101832d695b18abaad20f73bf7e" # linux-amd64
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
