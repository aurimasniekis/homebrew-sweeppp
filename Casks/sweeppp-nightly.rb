cask "sweeppp-nightly" do
  arch arm: "arm", intel: "intel"

  version "0.1.0+e6f6f9f8"
  sha256 arm:   "f2ec83644bb135a7c6730f5904c02865da44ba256c9ae907db967123921ac4f6",
         intel: "72f5e409de86964d482ef24d53c9ee47774f9463ea5c453277c2b570025f5ea2"

  url "https://github.com/aurimasniekis/sweeppp-dev/releases/download/nightly/sweeppp-nightly-macos-#{arch}.tar.gz?build=e6f6f9f8"
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
