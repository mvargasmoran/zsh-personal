alias g='git'

alias gb='git branch'
alias gbda='git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch -d 2>/dev/null'
alias gbD='git branch -D'
alias gbl='git blame -b -w'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcp='git cherry-pick'

alias gd='git diff'
alias gf='git fetch'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'

alias gcl='git clone --recurse-submodules'
alias gca='git commit -v -a'
alias gco='git checkout'
gcm='git checkout $(git_main_branch)'

alias gm='git merge'
alias gma='git merge --abort'

alias gst='git status'
alias gsb='git status -sb'

alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp="_git_log_prettily"

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}

function current_branch() {
  git_current_branch
}

function __git_prompt_git() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}


# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ "$(__git_prompt_git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ "${DISABLE_UNTRACKED_FILES_DIRTY:-}" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    case "${GIT_STATUS_IGNORE_SUBMODULES:-}" in
      git)
        # let git decide (this respects per-repo config in .gitmodules)
        ;;
      *)
        # if unset: ignore dirty submodules
        # other values are passed to --ignore-submodules
        FLAGS+="--ignore-submodules=${GIT_STATUS_IGNORE_SUBMODULES:-dirty}"
        ;;
    esac
    STATUS=$(__git_prompt_git status ${FLAGS} 2> /dev/null | tail -1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

# Gets the difference between the local and remote branches
function git_remote_status() {
    local remote ahead behind git_remote_status git_remote_status_detailed
    remote=${$(__git_prompt_git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]]; then
        ahead=$(__git_prompt_git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        behind=$(__git_prompt_git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

        if [[ $ahead -eq 0 ]] && [[ $behind -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE"
        elif [[ $ahead -gt 0 ]] && [[ $behind -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE"
            git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE$((ahead))%{$reset_color%}"
        elif [[ $behind -gt 0 ]] && [[ $ahead -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE"
            git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE$((behind))%{$reset_color%}"
        elif [[ $ahead -gt 0 ]] && [[ $behind -gt 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE"
            git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE$((ahead))%{$reset_color%}$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE$((behind))%{$reset_color%}"
        fi

        if [[ -n $ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX$remote$git_remote_status_detailed$ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX"
        fi

        echo $git_remote_status
    fi
}
