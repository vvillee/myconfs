alias ls='ls -G --color=auto'
alias la='ls -la --color=auto'
alias lu='ls -ultrac'
alias gitl='git less'
alias gitm='git more'
alias gits='git summary'
alias gtags='git tag -l | sort -V'

gitsearch() {
    git log --grep="$1"
}
alias gsearch=gitsearch

findWithColors() {
    find . -type f -print0 | xargs -I '{}' -0 zgrep --color "$1" '{}';
}
findWithFilename() {
    find . -type f -print0 | xargs -I '{}' -0 zgrep -H --color "$1" '{}';
}
findFromFilenames() {
    find . -type f -iname *$1*
}
alias findc=findWithColors
alias findcf=findWithFilename
alias findf=findFromFilenames
