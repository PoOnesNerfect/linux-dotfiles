export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
[[ -d $XDG_CONFIG_HOME/zsh ]] && export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# for some reason, it only works in wsl if I source it twice
source "$ZDOTDIR/.zshenv"
source "$ZDOTDIR/.zshenv"