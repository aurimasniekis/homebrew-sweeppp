cask "sweeppp-nightly" do
  arch arm: "arm", intel: "intel"

  version "0.1.0+7f4a5678"
  sha256 arm:   "92684c2d9902ac3ee0824327b8ea216c1b11b524d2c98261821c0d06375a4d81",
         intel: "f7df3c168664a3099af46d0127532293572e23f0311b62204dbd3a1daf6482b3"

  url "https://github.com/aurimasniekis/sweeppp-dev/releases/download/nightly/sweeppp-nightly-macos-#{arch}.tar.gz?build=7f4a5678"
  name "Sweep++ Nightly"
  desc "Wideband spectrum analyser for software-defined radios"
  homepage "https://sweeppp.app/"

  depends_on formula: "glfw"
  depends_on macos: ">= :ventura"

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
