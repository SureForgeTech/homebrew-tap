cask "sureforge-capture" do
  version "1.1.2"
  sha256 "6cadca829d001a4996e475c4d1820f8c9cea7ec598314048baa6ffa6c24f1ad7"

  url "https://github.com/SureForgeTech/sureforge-capture/releases/download/v#{version}/BugNarrator-v#{version}-macOS.dmg"
  name "SureForge Capture"
  name "BugNarrator"
  desc "Narrate macOS testing sessions and turn them into bug reports"
  homepage "https://github.com/SureForgeTech/sureforge-capture"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "BugNarrator.app"
end
