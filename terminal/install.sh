#!/bin/bash

# Clone tmux-logging plugin
git clone https://github.com/tmux-plugins/tmux-logging.git /opt/tmux-logging

# Set up LS_COLORS
mkdir -p "$HOME/.lscolors"
curl -s 'https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/lscolors.sh' > $HOME/.lscolors/lscolors.sh

# Install Rust without prompts
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
rustup update
cargo install lsd

# Install Oh My Zsh without prompts
export RUNZSH=no
export KEEP_ZSHRC=yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change the shell to Zsh if it isn't already
if [ "$SHELL" != "/bin/zsh" ] && [ "$SHELL" != "/usr/bin/zsh" ]; then
    chsh -s $(which zsh)
fi

# Install pyenv without prompts
curl https://pyenv.run | bash

# Set up pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Install the latest Python 3 version
pyenv install $(pyenv latest -k 3)
pyenv global $(pyenv latest -k 3)
