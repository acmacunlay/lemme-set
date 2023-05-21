#!/usr/bin/env bash

INTRO="
🔨️ Ubuntu Post-Installation Setup (Development)

This script sets setup a device with an Ubuntu distribution for software development.
"

draw_h_line() {
    # See: https://stackoverflow.com/questions/42762643
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
}

setup_awscli_v2() {
    # (i) Setup dependencies.
    cd ~
    sudo apt install unzip -y

    # (ii) Setup application.
    AWS_CLI_V2_URL=https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
    AWS_CLI_V2_ZIP=awscliv2.zip

    sudo rm -f $AWS_CLI_V2_ZIP
    sudo rm -f -r ./aws
    curl -s $AWS_CLI_V2_URL -o $AWS_CLI_V2_ZIP
    unzip $AWS_CLI_V2_ZIP
    ./aws/install --update
    source ~/.bashrc

    # (iii) Check if setup was successful.
    # echo && echo "Checking AWS CLI version..." && echo
    # aws --version

    # (iv) Cleanup.
    sudo rm -f $AWS_CLI_V2_ZIP
}

setup_python() {
    # (i) Setup dependencies.
    cd ~
    sudo rm -f -r /root/.pyenv
    sudo rm -f -r ~/.pyenv
    sudo apt-get install \
        make build-essential libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev \
        xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

    # (ii) Setup application.
    # See: https://brain2life.hashnode.dev/how-to-install-pyenv-python-version-manager-on-ubuntu-2004
    # See: https://github.com/pyenv/pyenv#installation
    PYENV_URL=https://pyenv.run

    curl -s $PYENV_URL | bash
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.bashrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.bashrc
    echo 'eval "$(pyenv init -)"' >>~/.bashrc
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.profile
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.profile
    echo 'eval "$(pyenv init -)"' >>~/.profile
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.bash_profile
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.bash_profile
    echo 'eval "$(pyenv init -)"' >>~/.bash_profile
    source ~/.bashrc

    # (iii) Check if setup was successful.
    # echo && echo "Checking pyenv version..." && echo
    # pyenv --version

    # (iv) Cleanup.
}

setup_nodejs() {
    # (i) Setup dependencies.
    cd ~
    sudo rm -f -r /root/.nvm

    # (ii) Setup application.
    NVM_URL=https://raw.githubusercontent.com/creationix/nvm/master/install.sh

    curl -s $NVM_URL | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    source ~/.bashrc

    # (iii) Check if setup was successful.
    # echo && echo "Checking NVM version..." && echo
    # nvm --version

    # (iv) Cleanup.
}

setup_jvm() {
    # (i) Setup dependencies.
    cd ~
    sudo apt install zip unzip -y

    # (ii) Setup application.
    SDKMAN_URL=https://get.sdkman.io

    curl -s $SDKMAN_URL | bash
    source ~/.bashrc

    # (iii) Check if setup was successful.
    # echo && echo "Checking SDKMAN! version..." && echo
    # sdk version

    # (iv) Cleanup.
}

# confirm_execution() {
#     echo && read -p "Do you wish to continue setup? [y/n]: " yn && echo
#     case $yn in
#     [Yy]*) echo "User confirmed execution." && return 0 ;;
#     [Nn]*) echo "User cancelled execution." && exit ;;
#     *) echo "Invalid input." && exit ;;
#     esac
# }

main() {
    draw_h_line
    echo "$INTRO"
    draw_h_line

    # confirm_execution

    echo && echo "[1/6]: 🔐️ Getting system updates..."
    echo && sudo apt update && sudo apt upgrade
    echo && draw_h_line

    echo && echo "[2/6]: 🔨️ Setting up AWS CLI v2..."
    echo && setup_awscli_v2
    echo && draw_h_line

    echo && echo "[3/6]: 🔨️ Setting up Python..."
    echo && setup_python
    echo && draw_h_line

    echo && echo "[4/6]: 🔨️ Setting up NodeJS..."
    echo && setup_nodejs
    echo && draw_h_line

    echo && echo "[5/6]: 🔨️ Setting up JVM..."
    echo && setup_jvm
    echo && draw_h_line

    echo && echo "[6/6]: 🧹️ Cleanup..."
    echo && sudo apt autoremove
    echo && draw_h_line

    echo && echo "Setup finished. ✨️" && echo
}

main
