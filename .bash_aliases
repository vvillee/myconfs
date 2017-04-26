alias la='ls -la'
alias ultra='ls -ultrac'
alias gitl='git less'
alias gitm='git more'
alias gits='git summary'
alias tags='git tag -l | sort -V'

gitsearch() {
    git log --grep="$1"
}
alias gitsearch=gitsearch

findWithColors() {
    find . -type f -print0 | xargs -I '{}' -0 zgrep --color "$1" '{}';
}
findWithFilename() {
    find . -type f -print0 | xargs -I '{}' -0 zgrep -H --color "$1" '{}';
}
findFromFilenames() {
    find . -type f -iname *$1*
}
alias colorfind=findWithColors
alias namefind=findWithFilename
alias filefind=findFromFilenames
