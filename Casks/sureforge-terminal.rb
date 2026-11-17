cask "sureforge-terminal" do
  version "0.1.0"
  sha256 "ebce7199b799890bcfeb1bfe4d975387681275edbfbc7b2bf97de9daf45de98d"

  url "https://github.com/SureForgeTech/sureforge-terminal/releases/download/v#{version}/terminal-workspace-macos-v#{version}.dmg"
  name "SureForge Terminal"
  name "Terminal Workspace"
  desc "Local-first SSH client with sessions, SFTP, snippets and port forwards"
  homepage "https://github.com/SureForgeTech/sureforge-terminal"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Terminal Workspace.app"
end
