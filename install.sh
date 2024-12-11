# install tmux
sudo apt install -y tmux
mkdir -p ~/.config/nvim

# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# install tpm
sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# setup wezterm
cp ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua


# install nvim
sudo snap install neovim --classic

# install yadm for gitsigns
sudo apt install yadm

# copy nvim config
cp -r ~/dotfiles/nvim/ ~/.config

# setup starship
curl -sS https://starship.rs/install.sh | sh
cp ~/dotfiles/starship.toml ~/.config

# install bash autocompletions
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc
