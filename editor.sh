#!/usr/bin/env bash

PS3='Please enter your editor of choice: '
QUIT="Quit Install"
touch "$QUIT"

options=("atom" "vscode" "vim" "sublime" "$QUIT")

select opt in "${options[@]}"
do
    case $opt in
        "$QUIT")
            echo "Exiting..."
	    break
            ;;
        *)
            echo "Installing and setting up $opt"
            source editor/$opt/install.sh
            ;;
    esac
done
rm "$QUIT"
