cask "android-studio" do
  arch = Hardware::CPU.intel? ? "mac" : "mac_arm"

  version "2021.1.1.20"

  if Hardware::CPU.intel?
    sha256 "72c7f0f2e0d7d931c9d4ea394a413023f60692885aefe2cf91f33cdb77b4fb17"
  else
    sha256 "52604f8f9250986b0a69c0ec94f6db16260f3b1c25d73b073dd982429d38d6c9"
  end

  url "https://redirector.gvt1.com/edgedl/android/studio/install/#{version}/android-studio-#{version}-#{arch}.dmg",
      verified: "redirector.gvt1.com/edgedl/android/studio/"
  name "Android Studio"
  desc "Tools for building Android applications"
  homepage "https://developer.android.com/studio/"

  livecheck do
    url :homepage
    regex(/android[._-]studio[._-]v?(\d+(?:\.\d+)+)[._-]#{arch}\.dmg/i)
  end

  auto_updates true

  app "Android Studio.app"

  zap trash: [
    "~/.android",
    "~/Library/Android/sdk",
    "~/Library/Application Support/Google/AndroidStudio#{version.major_minor}",
    "~/Library/Caches/Google/AndroidStudio#{version.major_minor}",
    "~/Library/Logs/Google/AndroidStudio#{version.major_minor}",
    "~/Library/Preferences/com.android.Emulator.plist",
    "~/Library/Preferences/com.google.android.studio.plist",
    "~/Library/Saved Application State/com.google.android.studio.savedState",
  ],
      rmdir: [
        "~/AndroidStudioProjects",
        "~/Library/Android",
      ]
end
