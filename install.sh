# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.git \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.direnv \
    nixpkgs.gh \
    nixpkgs.silver-searcher
# stow
stow git
stow zsh
stow nvim

# enable zsh in /etc/shells 
command -v zsh | sudo tee -a /etc/shells

# make zsh default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins with antibody
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# make vim install plugins
nvim --headless +PlugInstall +qall

