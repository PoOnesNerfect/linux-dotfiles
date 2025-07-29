#!/bin/zsh

ZDOTDIR="$HOME/linux-dotfiles/.zsh"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done