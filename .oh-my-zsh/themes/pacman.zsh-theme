function dir_icon {
  if [[ "$PWD" == "$HOME" ]]; then
    echo "%B%F{green}%f%b"
  else
    echo "%B%F{cyan}%f%b"
  fi
}

PROMPT='
%B%F{blue}%f%b  %B%F{yellow}%n%f%b $(dir_icon)  %B%F{magenta}%~%f%b${vcs_info_msg_0_} 
%(?.%B%F{yellow} .%F{red} )%f%b '

RPROMPT='$(git_prompt_info) $(ruby_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}] %{$fg[red]%}✖ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}] %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_RUBY_PROMPT_SUFFIX="]%{$reset_color%}"
