cask "ackagent" do
  version "0.0.38"
  sha256 "71a899b3043a2eb045dad3d2f098de74531e6acd7dd6a93d4157abc32ccaed81" # pkg

  url "https://github.com/ackagent/ackagent/releases/download/v#{version}/AckAgent-v#{version}-arm64.pkg"
  name "AckAgent"
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  pkg "AckAgent-v#{version}-arm64.pkg"

  uninstall pkgutil: "com.ackagent.cli"
end
