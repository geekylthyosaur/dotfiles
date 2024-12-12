if command -v "git" &> /dev/null
    alias gs="git status"
    alias gl="git log"
    alias gd="git diff"
    alias gds="git diff --staged"
    alias gaa="git add -A"

    abbr -a ga 'git add'
    abbr -a gcm --set-cursor=! 'git commit -m "!"'
    abbr -a gca --set-cursor=! 'git add -A; git commit -m "!"'
    abbr -a gco 'git checkout'
    abbr -a gu 'git reset --soft HEAD^'
end

