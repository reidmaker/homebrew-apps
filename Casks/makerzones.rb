cask "makerzones" do
  version "1.3.1"
  sha256 "26d9203f04aca1b3f1cfb50568d6362218e9e04127a3e2a498157f7106ad54fa"

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
