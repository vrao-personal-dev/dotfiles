# for tmux ctrl + k to work
bindkey \^K kill-line
WORDCHARS=""

alias gbr='git branch'
alias gcm='git commit'
alias gdf='git diff --minimal '
alias gps='git push' 
alias gst='git status -s -b -u'
alias gfm='git fetch origin master:master'
alias gch='git checkout '
alias glo='git log --oneline -n 5'
alias glo1='git log --oneline -n '
gsn() {git stash apply stash^{/"$1"} }

# brew install gh
alias gh='EDITOR=vim gh'

# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install
# Use uninstall script to remove fzf.
gco() {
  if [[ $# -eq 0 ]]; then
    git checkout $(git branch --list | fzf)
  else
    git branch --list | grep "$1" | fzf | xargs git checkout
  fi
}
gme() {gh pr status | grep -A 10 'Requesting a code review from you'}

alias less='less -S'
alias run-help=man
alias which-command=whence

layout_uv_pyenv() {
    if [ -e ".python-version" ]; then
        VENV=`cat .python-version`
        echo "VENV: $VENV"
        VENV_PATH="$PYENV_ROOT/versions/$VENV"
        export UV_PYTHON=$VENV_PATH/bin/python
        export UV_PROJECT_ENVIRONMENT=$VENV_PATH
        export UV_ACTIVE=1
    fi
}

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/vrao/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# brew install direnv
direnv hook zsh 

export JIRA_AUTH_TYPE=bearer
export JIRA_API_TOKEN=
alias jcreateraw='somehow jira api it'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vrao/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vrao/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vrao/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/vrao/google-cloud-sdk/completion.zsh.inc'; fi
