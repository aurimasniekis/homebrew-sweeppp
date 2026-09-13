cask "sweeppp-nightly" do
  arch arm: "arm", intel: "intel"

  version "0.1.0+834e2415"
  sha256 arm:   "2aeecb23d38b9a850b37c11af1e51da5f92843e50474942e6ad4c19613e5c8d2",
         intel: "1eebb418e0c2137b0219d375f9d741f7e85f5a59077c5322f30c002078a829b0"

  url "https://github.com/aurimasniekis/sweeppp-dev/releases/download/nightly/sweeppp-nightly-macos-#{arch}.tar.gz?build=834e2415"
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
