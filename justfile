# use zsh instead of sh:
set shell := ["zsh", "-c"]

alias fm := subrepo-pull
alias p := subrepo-push
alias d := dump-package-info
alias su := submodule-update
alias iz := init-zprezto

# run `stow .`
default:
  stow .

# Push latest changes to subrepos (zprezto)
subrepo-push *args:
  git subrepo push $ZDOTDIR/prezto {{ args }}

# Pull latest changes to subrepos (zprezto)
subrepo-pull *args:
  cp .gitmodules ../.gitmodules.dotfiles.bak
  git subrepo pull $ZDOTDIR/prezto {{ args }}
  mv ../.gitmodules.dotfiles.bak .gitmodules

# dumps all packages installed by `cargo`, `brew`, and `npm`
dump-package-info:
  brew bundle dump --force --file ~/dotfiles/pkgs/Brewfile
  cargo install --list >! ~/dotfiles/pkgs/cargo-pkgs
  npm list -g >! ~/dotfiles/pkgs/npm-pkgs

# initialize zprezto
init-zprezto: submodule-update
  #!/usr/bin/env zsh
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

# recursively initialize and update submodules
submodule-update:
  git submodule update --init --recursive
