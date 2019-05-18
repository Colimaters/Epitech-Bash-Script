#!/bin/bash

clear
echo -e "Ok commençons à cloner !\n"
read -p "Qui est le propriétaire du repo (login sans @) ? " login
read -p "Et le nom du repo ? " nomrepo

if [ -z $login ] || [ -z $nomrepo ]; then
    echo -e "The login or the repo name are empty ! Please enter valid informations !"
    exit 84
fi

if [ $login = moi ] || [ $login = darius.morel ]; then
    echo -e "C'est parti pour cloner un repo perso !\n"
    git clone git@git.epitech.eu:/darius.morel@epitech.eu/$nomrepo
    ret=$(echo $?)
else
    echo -e "Clonons un repo d'un copain !\n"
    git clone git@git.epitech.eu:/$login@epitech.eu/$nomrepo
    ret=$(echo $?)
fi

if [ $ret = 0 ]; then
    echo -e "\nFin du clonage !\n"
elif [ $ret = 128 ]; then
    echo -e "\nAn error occur. Verify the login or the repo name !\n"
fi
read -p "Press enter to clear !" wait
clear