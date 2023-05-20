#!/usr/bin/env bash

INTRO="""
🔨️ Ubuntu Post-Installation Setup (Development)

This sets setup a device with an Ubuntu distribution for software development.
"""

draw_h_line() {
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
}

update_system_dependencies() {
    sudo apt update
    sudo apt upgrade
    return
}

setup_awscliv2_dependencies() {
    echo "Code reached here."
    return
}

setup_awscliv2() {
    setup_awscliv2_dependencies
    return
}

setup_python_dependencies() {
    echo "Code reached here."
    return
}

setup_python() {
    setup_python_dependencies
    return
}

setup_nodejs_dependencies() {
    echo "Code reached here."
    return
}

setup_nodejs() {
    setup_nodejs_dependencies
    return
}

setup_java_dependencies() {
    echo "Code reached here."
    return
}

setup_java() {
    setup_java_dependencies
    return
}

main() {
    draw_h_line
    echo "${INTRO}"
    draw_h_line

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
