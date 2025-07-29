# Setting Up Prezto for Zsh

[PoOnesNerfect/prezto: The configuration framework for Zsh](https://github.com/PoOnesNerfect/prezto) 

### Setup

Recursively initialize/update all submodules, including Prezto and its submodules.

```sh
conf submodule update --init --recursive
```

#### Create Symlinks

```sh
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

#### Set zsh as your default shell

```sh
chsh -s /bin/zsh
```