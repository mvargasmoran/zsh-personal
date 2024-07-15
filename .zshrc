#zmodload zsh/zprof

# Git functions related to that
# I actually use (aliases mostly) and
source ~/.config/zsh-personal/git-personal-aliases.zsh

# ohmyzsh aliases that I've grown accostumed to
source ~/.config/zsh-personal/general-personal-aliases.zsh

# Enable substitution in the prompt.
setopt prompt_subst
source ~/.config/zsh-personal/modified-agnoster.zsh-theme

#zprof

#alias luamake=/Users/marcos/Code/sumneko/lua-language-server/3rd/luamake/luamake

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# total neckbeard crap
nerdfetch

#set up fzf key bindings
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
