#!/usr/bin/env bash

case $1 in
    "quit")
        echo "Exiting..."
        break
        ;;
    *)
        echo "Installing and setting up $1"
        source editor/$1/install.sh
        ;;
esac
