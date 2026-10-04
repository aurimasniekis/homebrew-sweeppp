cask "sweeppp-nightly" do
  arch arm: "arm", intel: "intel"

  version "0.1.0+3478f662"
  sha256 arm:   "1112162e802acefe3d2b862127e77ec8fafb1a97e9d6f3d4d1f383cd54bc9f6f",
         intel: "20847112d0c884ecd9b44cf09ef23c6f827df32f1cdbfdb6c3c8fcd813433ade"

  url "https://github.com/aurimasniekis/sweeppp/releases/download/nightly/sweeppp-nightly-macos-#{arch}.tar.gz?build=3478f662"
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
