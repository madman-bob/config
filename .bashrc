# History

HISTCONTROL=ignoreboth # Ignore lines starting with spaces, and duplicates
HISTIGNORE="pass *:p *:2fa *"
HISTSIZE=100
HISTFILESIZE=200
shopt -s histappend

# Aliases

alias clip="clip.exe" # WSL specific
alias p="pass code"
alias 2fa="oathtool --base32 --totp -d 6"

win() {
    explorer.exe `wslpath -w "${1:-.}"`
}
