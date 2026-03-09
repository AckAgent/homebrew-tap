class Ackagent < Formula
  desc "Out-of-band approval with hardware-backed cryptographic signing"
  homepage "https://ackagent.com"
  url "https://github.com/AckAgent/cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9de1f8ca29109364332a5968f76d052764b676c594c4ebb83468e393e3132eb8"
  license :cannot_represent

  depends_on "go" => :build

  def install
    # Download pre-built BBS+ FFI static library (required for CGo linking)
    system "make", "download-bbs-ffi"

    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    ENV["CGO_ENABLED"] = "1"

    # Build CLI
    system "go", "build", *std_go_args(ldflags:), "./cmd/ackagent"

    # Build age plugin
    system "go", "build", "-ldflags", ldflags.join(" "),
           "-o", bin/"age-plugin-ackagent", "./cmd/age-plugin-ackagent"

    # Build sk-provider (separate Go module)
    lib_ext = OS.mac? ? "dylib" : "so"
    cd "sk-provider" do
      system "go", "build", "-buildmode=c-shared",
             "-ldflags", ldflags.join(" "),
             "-o", lib/"libackagent-sk.#{lib_ext}", "."
    end

    # Build pkcs11-provider
    system "go", "build", "-buildmode=c-shared",
           "-ldflags", ldflags.join(" "),
           "-o", lib/"libackagent-pkcs11.#{lib_ext}", "./pkcs11-provider"
  end

  def caveats
    lib_ext = OS.mac? ? "dylib" : "so"
    <<~EOS
      SSH SecurityKeyProvider (software keys):
        Add to ~/.ssh/config:
          SecurityKeyProvider #{opt_lib}/libackagent-sk.#{lib_ext}

      SSH PKCS#11 provider (hardware keys):
        Add to ~/.ssh/config:
          PKCS11Provider #{opt_lib}/libackagent-pkcs11.#{lib_ext}
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ackagent --version")
    assert_predicate bin/"age-plugin-ackagent", :exist?
    lib_ext = OS.mac? ? "dylib" : "so"
    assert_predicate lib/"libackagent-sk.#{lib_ext}", :exist?
    assert_predicate lib/"libackagent-pkcs11.#{lib_ext}", :exist?
  end
end
