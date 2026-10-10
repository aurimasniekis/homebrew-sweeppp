cask "sweeppp" do
  arch arm: "arm", intel: "intel"

  version "0.2.0"
  sha256 arm:   "2fb16d401ea19ee8f0026ff93f8e3da2ac8fa8229f6869d47db95026955b87e9",
         intel: "613db71b76794d0171562059bd4ec89f122abfdac452c8b719e3b5935abaf639"

  url "https://github.com/aurimasniekis/sweeppp/releases/download/v#{version}/sweeppp-#{version}-macos-#{arch}.tar.gz"
  name "Sweep++"
  desc "Wideband spectrum analyser for software-defined radios"
  homepage "https://sweeppp.app/"

  depends_on formula: "glfw"
  depends_on macos: ">= :ventura"

  app "sweeppp-#{version}-macos-#{arch}/Sweep++.app"
  binary "sweeppp-#{version}-macos-#{arch}/sweeppp-cli"
  binary "sweeppp-#{version}-macos-#{arch}/sweeppp-server"
  binary "sweeppp-#{version}-macos-#{arch}/sweeps"

  zap trash: "~/Library/Application Support/sweeppp"

  caveats <<~CAVEATS
    The build is not signed. If macOS refuses to open it, run:
      xattr -dr com.apple.quarantine "/Applications/Sweep++.app"
  CAVEATS
end
