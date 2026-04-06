cask "makerzones" do
  version "1.3.0"
  sha256 "a7ad2489445a3dd6248f7a334d37614f2b58dffabd3dc7f2897319d8fb983484"

  url "https://github.com/makersoft-ai/homebrew-apps/releases/download/v#{version}/MakerZones-#{version}.zip"
  name "MakerZones"
  desc "FancyZones-style window tiling manager for macOS"
  homepage "https://makersoft.ai/makerzones-fancyzones-for-mac"

  depends_on macos: ">= :ventura"

  app "MakerZones.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "#{appdir}/MakerZones.app"], sudo: false
  end

  zap trash: [
    "~/Library/Preferences/ai.makersoft.makerzones.plist",
    "~/Library/Logs/MakerZones",
  ]
end
