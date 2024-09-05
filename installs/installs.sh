!#/bin/bash

if ! command -v brew &> /dev/null
then
    echo "Homebrew package manager not found."
    read -p "Install Homebrew? (Y/n): " confirm
    case $confirm in    
        "y"|"Y"|"")
            echo "Installing Homebrew."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            ;;
        "n"|"N")
            echo "Homebrew is required for this installation."
            echo "Exiting."
            exit 1
            ;;
        *)
            echo "Invalid input."
            echo "Exiting."
            exit 1
            ;;
    esac
else
    echo "Homebrew detected."
    brew update
    brew upgrade
fi

echo "Installing Homebrew Packages."
        
brew install node tmux fzf neovim bat lua luajit luarocks python php pipx tree-sitter pretty-php prettierd ktlint neofetch gnu-sed
exit 0
