cask "sweeppp-nightly" do
  arch arm: "arm", intel: "intel"

  version "0.1.0+105db27f"
  sha256 arm:   "65f996e07b25eb983b994ed10f75a65356c5ee58e896a9e52292e9c5dffd5d27",
         intel: "ff0e79c5525a258512552a52f987d0259d17c6b95542dbc2538ec13f8d20a09a"

  url "https://github.com/aurimasniekis/sweeppp/releases/download/nightly/sweeppp-nightly-macos-#{arch}.tar.gz?build=105db27f"
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
