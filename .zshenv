PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
PATH="$HOME/bin:$PATH"

alias refaultswrite="defaults read > /Users/kevin/.refaults.json"
alias refaults="diff --color /Users/kevin/.refaults.json <(defaults read)"
alias r="refaults"
alias rw="refaultswrite"

# Recursively remove DS_STORE files
alias remove-all-ds-store="find . -name '.DS_Store' -type f -delete"

# easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."

alias g="git"
alias gs="git status"
alias gc='git commit -m'
alias v='vim'
alias code=codium

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# common HTTP protocol
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
        alias "${method}"="lwp-request -m '${method}'"
done

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
