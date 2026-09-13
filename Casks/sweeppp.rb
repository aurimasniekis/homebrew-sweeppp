cask "sweeppp" do
  arch arm: "arm", intel: "intel"

  version "0.1.0"
  sha256 arm:   "5b51f4f78c46e5f06d2f3ed321161961afbe47ba3b8e6f1b7af4da0b3d26902f",
         intel: "b2fb4e4c0c30443b6b3f2ef2684ae9c31cb9122e051c6bc7270a3f004116fb61"

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
