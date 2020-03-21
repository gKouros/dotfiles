# My custom zsh theme

source $ZSH/plugins/git-prompt/git-prompt.plugin.zsh

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n$fg[cyan]@$fg[magenta]%m%{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[cyan]%}%n%{$fg[red]%}@%{$fg[magenta]%}%m%{$reset_color%}'
    local user_symbol='$'
fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local current_dir='%{$terminfo[bold]$fg[blue]%}%50<..<%~%<<%{$reset_color%}'
# local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local git_branch='$(git_super_status)%{$reset_color%}'

local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

# Custom values for the appearance of the prompt.
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{✚ %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖ %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{● %G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓ %G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑ %G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}%{● %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{ %G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔ %G%}"

PROMPT="%{$fg[yellow]%}╭─${user_host} ${current_dir} ${rvm_ruby} ${git_branch}
%{$fg[yellow]%}╰─%{$reset_colors%}%B${user_symbol}%b "
RPS1=""
