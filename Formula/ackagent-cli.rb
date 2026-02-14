class AckagentCli < Formula
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"
  version "0.0.29"
  license :cannot_represent

  bottle do
    sha256 cellar: :any_skip_relocation, all: "67532efd9cc980306ac7a0a981680cb3044f50e756b411596e9c6b57ede332bc" # bottle
  end

  pour_bottle? do
    reason "This formula installs pre-built binaries."
    satisfy { false }
  end

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-darwin-arm64.tar.gz"
      sha256 "67532efd9cc980306ac7a0a981680cb3044f50e756b411596e9c6b57ede332bc" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-arm64.tar.gz"
      sha256 "069e49aca42b67ff1ee15b54aad73ef4f5ed68d94b332af31fbfce4424d31c27" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-v#{version}-linux-amd64.tar.gz"
      sha256 "ed482c944482fec7a1c5c8837d1c403d1e54cc6c6b4ff010541f173a3ecac453" # linux-amd64
    end
  end

  def install
    bin.install "ackagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ackagent --version")
  end
end
