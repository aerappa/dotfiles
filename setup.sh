#!/bin/bash

# Define the list of packages to check and install
declare -A packages=(
    [stow]="stow"
    [fzf]="fzf"
    [nvim]="nvim --classic"
    [tmux]="tmux"
    [git]="git"
    [fish]="fish"
    [jabref]="jabref"
    [zauthra]="zathura"
    [texlive]="texlive-full"
    [drive]="google-drive"
)

# Function to check and install packages
check_and_install() {
    for key in "${!packages[@]}"; do
        if ! command -v $key &> /dev/null; then
            echo "$key is not installed. Installing..."
            if [[ $key == "nvim" ]] || [[ $key == "jabref" ]]; then
                sudo snap install ${packages[$key]}
            elif [[ $key == "drive" ]]; then 
                sudo add-apt-repository ppa:alessandro-strada/ppa
                sudo apt-get update
                sudo apt-get install -y google-drive-ocamlfuse
            else
                sudo apt-get install -y ${packages[$key]}
            fi
        else
            echo "$key is already installed."
        fi
    done
}

# Function to run stow for the given packages
run_stow() {
    for folder in fish git nvim tmux; do
        stow $folder
        echo "Stow ran for $folder"
    done
}

# Main execution flow
echo "Checking and installing packages..."
check_and_install

echo "Running stow for configuration..."
run_stow

echo "Setup complete."

