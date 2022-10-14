# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
DISABLE_AUTO_UPDATE=true
ENABLE_CORRECTION=true
COMPLETION_WAITING_DOTS=true
plugins=(last-working-dir vi-mode zsh-autosuggestions zsh-syntax-highlighting)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets line main pattern regexp root)
ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source "$ZSH/oh-my-zsh.sh"

# Fixing pasting
pasteinit() {
	OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
	zle -N self-insert url-quote-magic
}
pastefinish() {
	zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# General variables
export GOPATH="$HOME/Documents/go"
export PATH="$PATH:$GOPATH/bin:$HOME/.local/bin:$HOME/.local/share/coursier/bin"
export EDITOR=vim
export THREADS=8
export MAKEFLAGS="-j$THREADS"
PS1="%F{cyan}%(?..%? )%F{cyan}%B░▒▓█%F{white}%K{cyan}%n@%m%F{cyan}%K{txtrst}█▓▒░ %F{cyan}%B%~ %% "

# Directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export ANDROID_HOME="$XDG_DATA_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export DVDCSS_CACHE="$XDG_DATA_HOME/dvdcss"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=/home/jakob/.config/java"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export MAXIMA_USERDIR="/home/jakob/.config/maxima"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PYTHONHISTFILE="$XDG_DATA_HOME/python_history"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"

# Short aliases
alias j="joplin"
alias l="ls -l --human-readable --all"
alias n="ncmpcpp"
alias r="ranger"
alias v="vim"

# Safety aliases
alias cp="cp --interactive"
alias mv="mv --interactive"

# Swapping aliases
alias nosleep="xset -dpms && xset s off"
alias dosleep="xset s on"
alias normalcaps="setxkbmap -option && setxkbmap de"
alias swapcaps="setxkbmap -option caps:swapescape"

# Convenience aliases
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias run_gha='grep run: .github/**/*yml | cut -d: -f2 | sh -e'
alias pkgcl='pacman --remove --cascade --recursive $(pacman --query --deps --quiet --unrequired --unrequired)'

neofetch
