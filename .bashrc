alias clip="clip.exe" # WSL specific
alias p="pass code"

win() {
    explorer.exe `wslpath -w "${1:-.}"`
}
