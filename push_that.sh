#!/bin/bash

commit=$*

clear

if [ $# = 0 ]; then
    echo -e "Enter arguments for quick commit message or -v to verbose mode !"
    exit 84
elif [ $# = 1 ] && [ $1 = "-v" ]; then
    echo -e "Add all files !\n"
    git add --all
    read -p "Enter your commit message : " commit
    echo
    git commit -m "$commit"
    if [ $(echo $?) = 1 ]; then
        exit 84
    fi
    git push
    echo -e "\nPush files to your repo !\n"
else
    git add --all
    git commit -m "$commit"
    git push
fi