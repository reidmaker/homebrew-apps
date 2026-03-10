cask "winmode" do
  version "1.0.0"
  sha256 "PLACEHOLDER_SHA256_HASH"

  url "https://github.com/reidmaker/MakerZones/releases/download/v#{version}/WinMode-#{version}.zip"
  name "WinMode"
  desc "Windows-style window management, keyboard shortcuts, and Alt+Tab for macOS"
  homepage "https://makersoft.ai/winmode-make-your-mac-work-like-windows"

  depends_on macos: ">= :ventura"

  app "WinMode.app"

  zap trash: [
    "~/Library/Preferences/ai.makersoft.winmode.plist",
    "~/Library/Logs/WinMode",
  ]

  caveats <<~EOS
    WinMode requires Accessibility permissions to remap keys and manage windows.
    After installation, grant access in:
      System Settings > Privacy & Security > Accessibility

    WinMode runs in the menu bar. Click the icon to open Settings.

    Upgrade to Pro for Alt+Tab switching, scroll reversal, per-app
    exclusions, and more: https://makersoft.ai
  EOS
end
