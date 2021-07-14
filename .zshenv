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

#Console emacs workaround
export PATH=$PATH:~/bashApps

alias uemacs="~/bashApps/emacs"

alias suemacs="sudo ~/bashApps/emacs"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="~/.cargo/bin:$PATH"

alias luamake=/Users/marcos/Code/sumneko/lua-language-server/3rd/luamake/luamake

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
