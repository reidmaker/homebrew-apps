# Homebrew Cask formula for MakerZones
# To submit: fork homebrew/homebrew-cask, add this file to Casks/m/makerzones.rb, submit PR
#
# Before submitting:
# 1. Build the .app bundle and create a .zip
# 2. Upload to GitHub Releases
# 3. Update the url and sha256 below
# 4. Test locally: brew install --cask ./makerzones.rb

cask "makerzones" do
  version "1.1.0"
  sha256 "0454a7ffe3a4d3e31ba4d7452f4fea29c479abc5b0451c2899d241768eb507da"

  url "https://github.com/makersoft-ai/homebrew-apps/releases/download/v#{version}/MakerZones-#{version}.zip"
  name "MakerZones"
  desc "FancyZones-style window tiling manager for macOS"
  homepage "https://makersoft.ai/makerzones-fancyzones-for-mac"

  depends_on macos: ">= :ventura"

  app "MakerZones.app"

  zap trash: [
    "~/Library/Logs/MakerZones",
    "~/.config/makerzones",
    "~/Library/Mobile Documents/com~apple~CloudDocs/MakerZones",
    "~/Library/Preferences/com.makerzones.plist",
  ]

  caveats <<~EOS
    MakerZones requires Accessibility permissions to manage windows.
    After installation, grant access in:
      System Settings > Privacy & Security > Accessibility

    Quick start:
      1. Hold Ctrl+Shift and drag any window to snap it to a zone
      2. Click the menu bar icon to open Settings

    Upgrade to Pro ($4.99 one-time) for unlimited zones, layouts,
    edge snapping, window memory, and more:
      https://makersoft.ai
  EOS
end
