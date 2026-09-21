cask "sweeppp-nightly" do
  arch arm: "arm", intel: "intel"

  version "0.1.0+a9162819"
  sha256 arm:   "328e6f00c983ea8d4e3de02f663cadcdc017e08f3a068bc0857a85906d9c4a99",
         intel: "198881288f638938a6db7e5ff182e96c9f81446f90370d50fbca7ebfc7369dc3"

  url "https://github.com/aurimasniekis/sweeppp/releases/download/nightly/sweeppp-nightly-macos-#{arch}.tar.gz?build=a9162819"
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
