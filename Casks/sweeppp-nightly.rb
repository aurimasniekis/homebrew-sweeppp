cask "sweeppp-nightly" do
  arch arm: "arm", intel: "intel"

  version "0.1.0+e885ef33"
  sha256 arm:   "53378d24dfb41ad398b9973bb99a2cabdb9d998852910054af1f3ef5474c055c",
         intel: "75027c2c6e233b090753f4d174478c8f152b9184866cc86a9c2a4fc22345e2f7"

  url "https://github.com/aurimasniekis/sweeppp/releases/download/nightly/sweeppp-nightly-macos-#{arch}.tar.gz?build=e885ef33"
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
