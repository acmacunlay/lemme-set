#!/usr/bin/env bash

INTRO="""
🔨️ Ubuntu Post-Install Setup (Development)

This sets setup a device with an Ubuntu distribution for software development.
"""

update_system_dependencies() {
    sudo apt update
    sudo apt upgrade
    return
}

setup_python() {
    echo "Code reached here."
    return
}

setup_nodejs() {
    echo "Code reached here."
    return
}

main() {
    echo "$INTRO"

    echo "[1/3]: 🔨️ Updating system dependencies..."
    update_system_dependencies

    echo "[2/3]: 🔨️ Setting up Python..."
    setup_python

    echo "[3/3]: 🔨️ Setting up NodeJS..."
    setup_nodejs

    return
}

main
