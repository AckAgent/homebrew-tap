class AckagentSkProvider < Formula
  desc "SSH SecurityKeyProvider for AckAgent (software keys)"
  homepage "https://ackagent.com"
  version "0.0.29"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "f88708263ba1b811baa95e7a26ada191dd9d9b06a152bcb38b94178f72416b2e" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-darwin-arm64.tar.gz"
      sha256 "f88708263ba1b811baa95e7a26ada191dd9d9b06a152bcb38b94178f72416b2e" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-linux-arm64.tar.gz"
      sha256 "b4da41af1d994f7213f489fe1efa2e303c849592eb76a975204b152d39a111d6" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-sk-provider-v#{version}-linux-amd64.tar.gz"
      sha256 "5ea7952e7cb9c43e030456a88b4a67e7671484a0c0d9e0238ff7eec179451ab6" # linux-amd64
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
