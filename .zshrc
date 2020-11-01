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

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

autoload -U compinit
compinit

export THREADS=8
export MAKEFLAGS="-j$THREADS"
PS1="%F{red}%(?..%? )%F{green}%B%K{green}█▓▒░%F{white}%K{green}%n@%m%F{green}%K{txtrst}█▓▒░ %F{green}%B%~ %% "

alias l="ls -l --human-readable --all"
alias v="vim"
alias r="ranger"

alias cp="cp --interactive"
alias mv="mv --interactive"

alias lock_screenon="i3lock --image ~/Desktop/Desktop.png"
alias lock="lock_screenon && xset dpms force off"
alias susp="lock_screenon && systemctl suspend"
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias pkgcl='sudo pacman --remove --cascade --recursive $(pacman --query --deps --quiet --unrequired --unrequired)'

alias boincsusp="sh -c 'cd /var/lib/boinc && boinccmd --set_run_mode never'"
alias boincres="sh -c 'cd /var/lib/boinc && boinccmd --set_run_mode auto'"

neofetch
