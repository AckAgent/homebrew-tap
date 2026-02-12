cask "ackagent" do
  version "0.0.25"
  sha256 "225f171af8d39de5e86919e28f0cef49efaad7b45be46e41e7167742b5c672e5" # pkg

  url "https://github.com/ackagent/ackagent/releases/download/v#{version}/AckAgent-v#{version}-arm64.pkg"
  name "AckAgent"
  desc "Out-of-band approval platform with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  pkg "AckAgent-v#{version}-arm64.pkg"

  uninstall pkgutil: "com.ackagent.cli"
end
