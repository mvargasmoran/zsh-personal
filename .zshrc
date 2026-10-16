#zmodload zsh/zprof

#USER: timestamp for the 'loaded in' echo at the bottom
zmodload zsh/datetime
typeset -g ZSH_LOAD_START=$EPOCHREALTIME

# Git functions related to that
# I actually use (aliases mostly) and
source ~/.config/zsh-personal/git-personal-aliases.zsh

# ohmyzsh aliases that I've grown accostumed to
source ~/.config/zsh-personal/general-personal-aliases.zsh

# Enable substitution in the prompt.
setopt prompt_subst
source ~/.config/zsh-personal/modified-agnoster.zsh-theme

#zprof

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# total neckbeard crap
#USER: stand-in for lolcat, which pays a ruby VM startup on every shell
rainbow() {
  local i=0 line
  while IFS= read -r line || [[ -n $line ]]; do
    printf '\e[38;5;%dm%s\e[0m\n' $(( 17 + (i++ * 7) % 40 )) "$line"
  done
}

fastfetch
figlet "Inspiring quote" | rainbow

#set up fzf key bindings
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# opencode
export PATH=/Users/marcosvargasmoran/.opencode/bin:$PATH

#USER: how long did all that take?
printf ' loaded in %dms\n' $(( (EPOCHREALTIME - ZSH_LOAD_START) * 1000 ))
