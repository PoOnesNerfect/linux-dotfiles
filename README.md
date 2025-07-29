# Dotfiles

Repository that stores all my development environment configurations.

It also contains some sensitive information, so don't make it public.

# Table of Contents

<!--toc:start-->

- [Dotfiles](#dotfiles)
- [Table of Contents](#table-of-contents)
- [Required Tools](#required-tools)
  - [stow](#stow)
  - [direnv](#direnv)
- [How to use it](#how-to-use-it)
  - [Updating existing files](#updating-existing-files)
  - [Adding new files](#adding-new-files)
- [Package Management Information](#package-management-information)
  - [Brewfile](#brewfile)
    - [dumping pkgs info to Brewfile:](#dumping-pkgs-info-to-brewfile)
    - [installing pkgs from Brewfile:](#installing-pkgs-from-brewfile)
  - [Cargo Packages](#cargo-packages)
    - [dumping pkgs info to cargo-pkgs:](#dumping-pkgs-info-to-cargo-pkgs)
    - [installing pkgs from cargo-pkgs:](#installing-pkgs-from-cargo-pkgs)
  - [NPM Global Packages](#npm-global-packages)
    - [dumping pkgs info to npm-pkgs:](#dumping-pkgs-info-to-npm-pkgs)
    - [installing pkgs from npm-pkgs:](#installing-pkgs-from-npm-pkgs)

<!--toc:end-->

# Required Tools

## stow

Stow is a symlink manager that allows you to manage dotfiles in a separate directory.

[Stow](https://www.gnu.org/software/stow/manual/stow.html#Types-And-Syntax-Of-Ignore-Lists)

[Using GNU Stow to Manage Symbolic Links for Your Dotfiles - System Crafters](https://systemcrafters.net/managing-your-dotfiles/using-gnu-stow/#:~:text=If%20for%20some%20reason%20you,directory%20will%20now%20be%20gone!)

## direnv

[Installation | direnv](https://direnv.net/docs/installation.html)

# less (pager) key bindings

We need to apply `~/.lesskey` file with lesskey and build `~/.less` which will be picked up by less.

Simply run `lesskey` once which will do the job.

# How to use it

This repository is managed using `stow` to manage dotfiles.

The file structure in the repository must match the directory structure in the home directory exactly, only containing the config files.

## Updating existing files

Since all the files are symlinked, you can just edit the files directly and they will be updated automatically.

## Adding new files

When you add a new file in this repository, make sure to sync it with the home directory:

```sh
cd ~/dotfiles && stow .
```

# Package Management Information

This is how you keep track of the list of installed packages on your machine.

You can use these information to install the same packages on another machine.

## Brewfile

[Brew Bundle Tips](https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f)

### dumping pkgs info to Brewfile:

```sh
brew bundle dump --force --file ~/dotfiles/pkgs/Brewfile
```

### installing pkgs from Brewfile:

```sh
brew bundle install --file ~/dotfiles/pkgs/Brewfile
```

## Cargo Packages

### dumping pkgs info to cargo-pkgs:

```sh
cargo install --list >! ~/dotfiles/pkgs/cargo-pkgs
```

### installing pkgs from cargo-pkgs:

Install manually by looking at each line in the file.

## NPM Global Packages

### dumping pkgs info to npm-pkgs:

```sh
npm list -g >! ~/dotfiles/pkgs/npm-pkgs
```

### installing pkgs from npm-pkgs:

Install manually by looking at each line in the file.
