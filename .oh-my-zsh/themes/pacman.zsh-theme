
PROMPT='
%{$fg_bold[yellow]%}%~%{$fg_bold[yellow]%}%{$fg_bold[yellow]%} % %{$reset_color%}
%{$fg[green]%}  ➞  %{$reset_color%'

RPROMPT='$(git_prompt_info) $(ruby_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}] %{$fg[red]%}✖ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}] %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_RUBY_PROMPT_SUFFIX="]%{$reset_color%}"
