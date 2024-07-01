#!/bin/bash
sudo apt-get update

# install basic tools
read -p "Do you want to install ca-certificates, curl and make? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    sudo apt install ca-certificates curl make
fi

read -p "Do you want to install git? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    sudo apt install git
fi

read -p "Do you want to install podman? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    sudo apt install podman
fi

read -p "Do you want to install podman-compose? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    pip3 install podman-compose
fi

# install docker
read -p "Do you want to install Docker? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
fi

# inatall brave
read -p "Do you want to install Brave browser? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser
fi

# install distrobox
read -p "Do you want to install Distrobox ? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
fi

# install nvm
read -p "Do you want to install NVM (Node Version Manager) ? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

# install Rust
read -p "Do you want to install Rust? (Required to install most terminal utilities) (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# install eza
read -p "Do you want to install Eza (A modern, maintained replacement for ls)? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    cargo install eza
    echo 'alias ls="eza --color=auto"' >> ~/.bashrc
fi

# install oh my posh
read -p "Do you want to install Oh My Posh (A prompt theme engine)? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin

    mkdir -p ~/.config/.poshthemes
    curl -s https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/amro.omp.json > ~/.config/.poshthemes/paradox.omp.json

    echo 'eval "$(oh-my-posh init bash --config ~/.config/.poshthemes/paradox.omp.json)"' >> ~/.bashrc
fi

# install bat
read -p "Do you want to install Bat (A cat(1) clone with syntax highlighting and Git integration)? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    cargo install --locked bat
    echo "alias cat=bat" >> ~/.bashrc
fi

# install fd
read -p "Do you want to install fd (A simple, fast and user-friendly alternative to 'find')? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    cargo install fd-find
    echo "alias find=fd" >> ~/.bashrc
fi

# install bottom
read -p "Do you want to install bottom (A customizable cross-platform graphical process/system monitor for the terminal)? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    cargo install bottom --locked
    echo "alias top=btm" >> ~/.bashrc
fi

# install procs
read -p "Do you want to install procs (A modern replacement for ps)? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    cargo install procs
    echo "alias ps=procs" >> ~/.bashrc
fi

# install tealdeer
read -p "Do you want to install tealdeer (A very fast implementation of tldr. Collaborative cheatsheets for console commands)? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    cargo install tealdeer
    tldr --update
    echo "alias man=tldr" >> ~/.bashrc
fi

# install atuin
read -p "Do you want to install Atuin (Sync, search and backup shell history)? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
fi

# install zoxide and fzf
read -p "Do you want to install zoxide (Smarter cd command) and fzf (A general-purpose command-line fuzzy finder)? (Y/n) " answer
if [[ ! $answer =~ ^[Nn]$ ]]; then
    cargo install zoxide --locked
    echo 'eval "$(zoxide init --cmd cd bash)"' >> ~/.bashrc
    sudo apt install fzf
fi
