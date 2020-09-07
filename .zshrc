# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# disable autocorrect
unsetopt correct_all

# nvm
export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion" # This loads nvm bash_completion

# set default Python 3
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
