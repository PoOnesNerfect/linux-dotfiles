#!/bin/zsh

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
[[ -d $XDG_CONFIG_HOME/zsh ]] && export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done