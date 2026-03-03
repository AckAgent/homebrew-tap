cask "ackagent" do
  version "0.0.42"
  sha256 "0f114e4feac0ec7c4eab7313a861f0b51c815098f1c2e6a96341558010bbe1c6" # pkg

  url "https://github.com/ackagent/ackagent/releases/download/v#{version}/AckAgent-v#{version}-arm64.pkg"
  name "AckAgent"
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  pkg "AckAgent-v#{version}-arm64.pkg"

  uninstall pkgutil: "com.ackagent.cli"
end
