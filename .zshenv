export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export ZDOTDIR=$HOME/.zsh

# for some reason, it only works in wsl if I source it twice
source "$ZDOTDIR/.zshenv"
source "$ZDOTDIR/.zshenv"
. "$HOME/.cargo/env"
