# Needs to be run as admin, with repository root as the working directory

# Unlike setup.sh, this file is not idempotent
# So be sure to only run it once

echo "Install the Chocolatey package manager"
# See https://chocolatey.org/install
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

echo "Install generally useful programs"
choco install -y firefox dropbox

echo "Install editors"
choco install -y intellijidea-community typora

echo "Include my .vimrc in Intellij IdeaVim"
New-Item -Path "$HOME" -Name ".ideavimrc" -ItemType "file" -Value "source $(Get-Location | select -ExpandProperty Path)\.vimrc"

echo "Install communication programs"
choco install -y thunderbird discord

echo "Install WSL2"
choco install -y wsl2 wsl-ubuntu-2004

echo "Run updates on WSL2"
# May need something here to create a user, first
bash -c "sudo apt-get update && sudo apt-get upgrade"

echo "Run my setup on WSL2"
bash -c "./setup.sh"

echo "Set File Explorer default location to Dropbox\Notes"
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$ENV:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\File Explorer.lnk")
$Shortcut.TargetPath = "$HOME\Dropbox\Notes"
$Shortcut.Save()
