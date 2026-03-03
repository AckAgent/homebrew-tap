class AckagentCli < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"
  version "0.0.41"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "ca501a1f17d8afe2ec6c446757a831fda4737a65887b95b5281eeadda3a90cee" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "ca501a1f17d8afe2ec6c446757a831fda4737a65887b95b5281eeadda3a90cee" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "8782f107ec17c0317029997b3144fa960532959dd2f5375648bb560dc7b98f06" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "5f1b59f5c48ecbc15881ff1de11394a26f0725290e636355f6028bc5a95aa364" # linux-amd64
    end
  end

  def install
    bin.install "ackagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ackagent --version")
  end
end
