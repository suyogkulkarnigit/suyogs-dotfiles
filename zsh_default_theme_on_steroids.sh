## Copy paste this to your example theme in oh my zsh
## Before that please make sure you have omy zsh installed
## Use commands given below
## 1. cd $ZSH_CUSTOM/themes
## 2. Opne 'example.zsh-theme' file and replace all the contents of the file with this file.
## 3. Run 'omz theme set example'
## 4. and wolla you have cracked theme to work with 😈
## Very human friendly and highly customizable 😉

#Colors
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'

function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "%{$BOLD_GREEN%}📁 $(parse_git_dirty)${ref#refs/heads/}%{$BOLD_GREEN%}"
  fi
}

PROMPT='%{$reset_color%}$([ $VIRTUAL_ENV ] && echo 📦 $(basename $VIRTUAL_ENV))%b%{$reset_color%}
%{$reset_color%}%{$fg[white]%}%B${PWD/#$HOME/🗂️ }%b%{$reset_color%}
$(git_prompt_info)%  ➤ %{$reset_color%}'

# git theming
ZSH_THEME_GIT_PROMPT_DIRTY="%{$BOLD_RED%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$BOLD_GREEN%}"

# LS colors, made with https://geoff.greer.fm/lscolors/
export LSCOLORS="CxGxBxFxcxEgEcabCgacad"
export LS_COLORS="di=1;32:ln=1;36:so=1;31:pi=1;35:ex=32:bd=1;34;46:cd=1;34;42:su=30;41:sg=1;32;46:tw=30;42:ow=30;43"
