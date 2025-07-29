sudo apt update
sudo apt install build-essential -y

git submodule update --init --recursive

# zsh
sudo apt install zsh -y

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -f kubectl

# rust
curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# stow
sudo apt -y install stow

# starship
chmod +x ./scripts/install-starship.sh
sudo ./scripts/install-starship.sh

# nvim
if lsb_release -r | grep '20.04'; then
    curl -LO https://github.com/neovim/neovim-releases/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz
else
    curl -LO https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz
fi
sudo tar xzvf nvim-linux-x86_64.tar.gz -C /opt/
rm nvim-linux-x86_64.tar.gz

# lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# direnv
chmod +x ./scripts/install-direnv.sh
sudo ./scripts/install-direnv.sh

# fnm
sudo curl -fsSL https://fnm.vercel.app/install | bash

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cd ~/.fzf && ./install

# postgresql
sudo apt install postgresql postgresql-contrib -y

#
# Cargo Packages
#
chmod +x ./scripts/install-cargo-pkgs.sh
./scripts/install-cargo-pkgs.sh

# append to .gitconfig
cat >>~/.gitconfig <<'EOF'
[include]
    path = .config/delta/themes.gitconfig

[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only --features=interactive

[delta]
    navigate = true
    dark = false
    line-numbers = true
    # side-by-side = true
    # syntax-theme = GitHub
    tabs = 4

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default

[rerere]
    enabled = true
    autoupdate = true
EOF

# if exists, then backup
if [ -f ../.zshenv ]; then
    mv ../.zshenv ../.zshenv.bak
fi
if [ -f ../.zshrc ]; then
    mv ../.zshrc ../.zshrc.bak
fi

chsh -s $(which zsh)
chmod +x ./scripts/init-zsh.zsh
./scripts/init-zsh.zsh

stow .

cd && lesskey

