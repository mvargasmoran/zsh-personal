export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

#USER: use composer installed scripts easily
export PATH=$PATH:~/.composer/vendor/bin
#USER: launch sublime using console with 'subl' command
export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin

#add some frequent directories shortcuts
alias cdCode='cd ~/Code'
alias cdConf='cd ~/.config'
alias cdNvimConf='cd ~/.config/nvim'
alias cdZshPsnl='cd ~/.config/zsh-personal'
alias cdSvelte='cd ~/Code/svelte'
alias cdFoss='cd ~/Code/nvimThings'
alias cdTrain='cd ~/Code/ReallySeriousTraining'
alias cdNeovimLive='cd ~/Code/neovimconf/neovimconf-2024/NeoVimconf-site-2023'
alias cdYTD='cd ~/ytdownloads'
alias cdMTG='cd ~/mtg'

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
