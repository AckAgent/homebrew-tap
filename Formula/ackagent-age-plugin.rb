class AckagentAgePlugin < Formula
  desc "Age encryption plugin for AckAgent"
  homepage "https://ackagent.com"
  version "0.0.25"
  license :cannot_represent

  depends_on "ackagent/tap/ackagent-cli"

  on_macos do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-darwin-arm64.tar.gz"
      sha256 "717776fde956c66d9a99a9bc2e1d4dd2719a1973a64b69aab51e32df054c751c" # darwin-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-arm64.tar.gz"
      sha256 "2bf190704dd0783632b8f1910a4d82070223e63aac8074907553e19c3a8d1420" # linux-arm64
    end
    on_intel do
      url "https://github.com/ackagent/ackagent/releases/download/v#{version}/ackagent-age-plugin-v#{version}-linux-amd64.tar.gz"
      sha256 "e87d6ba3c25f61f5d949f08aa795860402443bf29a9759e85408e498c7f7f9d9" # linux-amd64
    end
  end

  def install
    bin.install "age-plugin-ackagent"
  end

  test do
    assert_predicate bin/"age-plugin-ackagent", :exist?
  end
end
