#zmodload zsh/zprof

# Git functions related to that
# I actually use (aliases mostly) and 
source ~/.config/zsh-personal/git-personal-aliases.zsh

# ohmyzsh aliases that I've grown accostumed to
source ~/.config/zsh-personal/general-personal-aliases.zsh

# NVM yep, I still use it, I'm gonna check fvm soon
export PATH=~/.nvm/versions/node/v14.16.1/bin:$PATH
# Load NVM
export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use


# Enable substitution in the prompt.
setopt prompt_subst
source ~/.config/zsh-personal/modified-agnoster.zsh-theme

#zprof
