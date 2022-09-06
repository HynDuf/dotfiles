export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export DENO_INSTALL="/home/hynduf/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export EDITOR=nvim
export JAVA_HOME=/usr/lib/jvm/java-18-openjdk
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

ZSH_THEME="pacman"

plugins=(git
        archlinux
        zsh-syntax-highlighting
        colorize        
        sudo    
        command-not-found)

source $ZSH/oh-my-zsh.sh

alias v='nvim-padding && nvim'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'
alias pom='~/bin/switch-desktop-workaround 7 follow & pomo start -t my-project "Study now"'
alias r='ranger'
alias f='fuck'
alias ss='screenshot'
setopt extendedglob
source $(dirname $(gem which colorls))/tab_complete.sh

# Comment this to upgrade miniconda3 package safely
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)
