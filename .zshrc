export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export EDITOR=nvim
export JAVA_HOME=/usr/lib/jvm/java-18-openjdk

ZSH_THEME="pacman"

plugins=(git
        archlinux
        zsh-syntax-highlighting
        colorize        
        sudo    
        command-not-found)

source $ZSH/oh-my-zsh.sh

alias vi='nvim-padding && nvim'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'
alias pom='~/bin/switch-desktop-workaround 7 follow && pomo start -t my-project "Study now"'
setopt extendedglob
source $(dirname $(gem which colorls))/tab_complete.sh

# Comment this to upgrade miniconda3 package safely
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
