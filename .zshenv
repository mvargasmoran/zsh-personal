export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

#USER: use composer installed scripts easily
export PATH=$PATH:~/.composer/vendor/bin
#USER: launch sublime using console with 'subl' command
export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin

#add some frequent directories shortcuts
alias cdCode="~/Code"
alias cdSvelte="~/Code/svelte"
alias cdNvimConf="~/.config/nvim"
alias cdZshPsnl="~/.config/zsh-personal"
alias cdFoss="~/Code/nvimThings"
alias cdTrain="~/Code/ReallySeriousTraining"
alias cdNeovimLive="~/Code/neovimconf/neovimconf-2024/NeoVimconf-site-2023"
alias cdYTD="~/ytdownloads"
alias cdMTG="~/mtg"

#Console emacs workaround

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="~/.cargo/bin:$PATH"
# export PATH="~/.local/bin/:$PATH"
# export PATH="/usr/local/opt/llvm/bin:$PATH"

alias luamake=/Users/marcos/Code/sumneko/lua-language-server/3rd/luamake/luamake

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
# . "$HOME/.cargo/env"
source "$HOME/.cargo/env"
