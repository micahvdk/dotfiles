#!/bin/bash
PS3='Please enter your editor of choice: '
options=("Atom" "VS Code" "VIM" "Sublime" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Atom")
            echo "Installing and setting up Atom"
            source editor/atom/install.sh
            ;;
        "VS Code")
            echo "Installing and setting up VS Code"
            source editor/vscode/install.sh
            ;;
        "VIM")
            echo "Installing and setting up VIM"
            source editor/vim/install.sh
            ;;
        "Sublime")
            echo "Installing and setting up Sublime Text"
            source editor/sublime/install.sh
            ;;
        "Exit")
            echo "Goodbye"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
