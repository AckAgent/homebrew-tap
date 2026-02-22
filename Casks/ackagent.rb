cask "ackagent" do
  version "0.0.32"
  sha256 "1e9448607d96bb8adccad690bdcbf0dcdc4f681856f55a1efc4aeda692a31b6e" # pkg

  url "https://github.com/ackagent/ackagent/releases/download/v#{version}/AckAgent-v#{version}-arm64.pkg"
  name "AckAgent"
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  pkg "AckAgent-v#{version}-arm64.pkg"

  uninstall pkgutil: "com.ackagent.cli"
end
