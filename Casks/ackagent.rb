cask "ackagent" do
  version "0.0.33"
  sha256 "fd41f3b4e3d3ed0c1ac3f5d742ebbdb130a804a4239f13ef013a6206588b9f88" # pkg

  url "https://github.com/ackagent/ackagent/releases/download/v#{version}/AckAgent-v#{version}-arm64.pkg"
  name "AckAgent"
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  pkg "AckAgent-v#{version}-arm64.pkg"

  uninstall pkgutil: "com.ackagent.cli"
end
