export PATH="/home/jakob/.local/bin:$PATH"

export ZSH="/home/jakob/.oh-my-zsh"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(last-working-dir vi-mode zsh-autosuggestions zsh-syntax-highlighting)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets line main pattern regexp root)
SAVEHIST=1000
source $ZSH/oh-my-zsh.sh

if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

autoload -U compinit
compinit

export THREADS=8
PS1="%F{green}%B%K{green}█▓▒░%F{white}%K{green}%n@%m%F{green}%K{txtrst}█▓▒░ %F{green}%B%~ %% "

alias l="ls -l --human-readable --all"
alias v="vim"
alias r="ranger"

alias cp="cp --interactive"
alias mv="mv --interactive"

alias lock="i3lock --image ~/Documents/Desktop.png"
alias susp="lock && sudo pm-suspend"
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias update="sudo emerge-webrsync"
alias upgrade="echo 'Remember to upgrade your /usr/local, Python & Node indices regularly' && sudo emerge --ask --verbose --update --deep --newuse --keep-going --with-bdeps=y @world"
alias pkgcl="sudo emerge --ask --depclean"
alias srccl="sudo eclean-dist --deep"

alias boincsusp="sh -c 'cd ~/Documents/BOINC && boinccmd --set_run_mode never'"
alias boincres="sh -c 'cd ~/Documents/BOINC && boinccmd --set_run_mode auto'"

sed -i "/^: [0-9]*:0;mpv/d" ~/.zsh_history
neofetch
