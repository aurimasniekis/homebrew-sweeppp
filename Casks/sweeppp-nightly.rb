cask "sweeppp-nightly" do
  arch arm: "arm"

  version "0.2.0+fe2dcdae"
  sha256 arm: "c0be30de37c2c35aa1041cc9d37b49e23bc2111783512d8e76f6a61bfc33d7cc"

  url "https://github.com/aurimasniekis/sweeppp/releases/download/nightly/sweeppp-nightly-macos-#{arch}.tar.gz?build=fe2dcdae"
  name "Sweep++ Nightly"
  desc "Wideband spectrum analyser for software-defined radios"
  homepage "https://sweeppp.app/"

  depends_on formula: "glfw"
  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "sweeppp-#{version}-macos-#{arch}/Sweep++ Nightly.app"
  binary "sweeppp-#{version}-macos-#{arch}/sweeppp-cli", target: "sweeppp-nightly-cli"
  binary "sweeppp-#{version}-macos-#{arch}/sweeppp-server", target: "sweeppp-nightly-server"
  binary "sweeppp-#{version}-macos-#{arch}/sweeps", target: "sweeps-nightly"

  zap trash: "~/Library/Application Support/sweeppp-nightly"

  caveats <<~CAVEATS
    The build is not signed. If macOS refuses to open it, run:
      xattr -dr com.apple.quarantine "/Applications/Sweep++ Nightly.app"
  CAVEATS
end
