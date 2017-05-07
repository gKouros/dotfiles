# My custom zsh theme

source $ZSH/plugins/git-prompt/git-prompt.plugin.zsh

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n$fg[cyan]@$fg[magenta]%m%{$reset_color%}'
else
    local user_host='%{$terminfo[bold]$fg[cyan]%}%n$fg[red]@$fg[magenta]%m%{$reset_color%}'
fi

local user_symbol='$'
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local git_branch='$(git_super_status)%{$reset_color%}'

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

PROMPT="$fg[yellow]╭─$reset_color${user_host} ${current_dir} ${git_branch}
$fg[yellow]╰─%B${user_symbol}$reset_color%b "
RPROMPT=""
