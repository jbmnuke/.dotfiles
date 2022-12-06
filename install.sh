# install nix-env
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix shell to setup environment
source ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
        nixpkgs.zsh \
        nixpkgs.antibody \
        nixpkgs.neovim \
        nixpkgs.tmux \
        nixpkgs.stow \
        nixpkgs.yarn \
        nixpkgs.fzf \
        nixpkgs.ripgrep \
        nixpkgs.bat \
        nixpkgs.tree \
        nixpkgs.direnv

# stow config files
stow git
stow zsh
stow nvim

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install neovim plugins
nvim --headless +PlugInstall +qall

# configure git
git config --global user.name "Justin McBride"
git config --global user.email "jbmnuke@yahoo.com"
git config --global init.defaultBranch "Primus"
