#!/usr/bin/env bash

INTRO="""
🔨️ Ubuntu Post-Installation Setup (Development)

This sets setup a device with an Ubuntu distribution for software development.
"""

draw_h_line() {
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
}

update_system_dependencies() {
    sudo apt update && sudo apt upgrade
    return 0
}

setup_awscli_v2() {
    # (i) Setup dependencies.
    echo "Code reached here."

    # (ii) Setup application.

    # (iii) Check if setup was successful.
    return 0
}

setup_python() {
    # (i) Setup dependencies.
    echo "Code reached here."

    # (ii) Setup application.

    # (iii) Check if setup was successful.
    return 0
}

setup_nodejs() {
    # (i) Setup dependencies.
    echo "Code reached here."

    # (ii) Setup application.

    # (iii) Check if setup was successful.
    return 0
}

setup_java() {
    # (i) Setup dependencies.
    echo "Code reached here."

    # (ii) Setup application.

    # (iii) Check if setup was successful.
    return 0
}

confirm_execution() {}

main() {
    draw_h_line
    echo "${INTRO}"
    draw_h_line

    read -p "Do you wish to install this program? [y/n]: " yn
    case $yn in
    [Yy]*)
        make install
        break
        ;;
    [Nn]*)
        exit
        ;;
    *)
        echo "Please answer yes or no."
        ;;
    esac

    echo
    echo "[1/3]: 🔨️ Updating system dependencies..."
    echo
    update_system_dependencies
    echo
    draw_h_line

    echo
    echo "[2/3]: 🔨️ Setting up Python..."
    echo
    setup_python
    echo
    draw_h_line

    echo
    echo "[3/3]: 🔨️ Setting up NodeJS..."
    echo
    setup_nodejs
    echo
    draw_h_line

    echo
    return
}

main
