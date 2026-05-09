cask "winmode" do
  version "1.3.1"
  sha256 "1a8bb97c5400eacd1f7f4a88e45f91180e67daf839e5837c1109e7c05989b6c9"

  url "https://github.com/makersoft-ai/homebrew-apps/releases/download/v#{version}/WinMode-#{version}.zip"
  name "WinMode"
  desc "Windows-style window management, keyboard shortcuts, and Alt+Tab for macOS"
  homepage "https://makersoft.ai/winmode-make-your-mac-work-like-windows"

  depends_on macos: ">= :ventura"

  app "WinMode.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "#{appdir}/WinMode.app"], sudo: false
  end

  zap trash: [
    "~/Library/Preferences/ai.makersoft.winmode.plist",
    "~/Library/Logs/WinMode",
  ]

  caveats <<~EOS
    WinMode requires Accessibility permissions to remap keys and manage windows.
    After installation, grant access in:
      System Settings > Privacy & Security > Accessibility

    WinMode runs in the menu bar. Click the icon to open Settings.
  EOS
end
