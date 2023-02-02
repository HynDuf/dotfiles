export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export DENO_INSTALL="/home/hynduf/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
# export EDITOR=nvim
export JAVA_HOME=/usr/lib/jvm/java-18-openjdk
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export FZF_DEFAULT_COMMAND="find \! \( -path '*/.git' -prune \) -printf '%P\n'"
export FZF_DEFAULT_OPTS='
  --color fg:#a9b1d6,bg:#11111b
  --color bg+:#2f263d,fg+:#a9b1d6,hl:#7aa2f7,hl+:#ff9e64,gutter:#3a404c
  --color pointer:#9ece6a,prompt:#ff7a93,info:#606672,spinner:#9ece6a
  --height 15'
export FZF_CTRL_T_COMMAND="find \! \( -path '*/.git' -prune \) -printf '%P\n'"
export FZF_ALT_C_COMMAND='find . -type d'

ZSH_THEME="pacman"

plugins=(git
        fzf-tab
        archlinux
        zsh-syntax-highlighting
        colorize        
        sudo    
        command-not-found)

source $ZSH/oh-my-zsh.sh

alias v='nvim'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'
alias pom='~/bin/switch-desktop-workaround 7 follow & pomo start -t my-project "Study now"'
alias r='ranger'
alias f='fzf'
alias ss='screenshot'

# Start jupyter notebook and edit something with neovim
# Usage: juv test.sync.py
alias juv='conda activate d2l > /dev/null 2>&1 && jupyter notebook > /dev/null 2>&1 & v'

# Create a paired .py file (in percent format) from a .ipynb file
# Usage: jug test.sync.ipynb
alias jug='jupytext --set-formats ipynb,py:percent'

setopt extendedglob
source $(dirname $(gem which colorls))/tab_complete.sh

# Comment this to upgrade miniconda3 package safely
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/z/z.sh

ulimit -s unlimited

