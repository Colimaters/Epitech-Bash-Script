#!/bin/bash

clear
echo -e "Ok commençons à cloner !\n"
read -p "QuI est le propriétaire du repo (login) ? " login
read -p "Et le nom du repo ? " nomrepo

if [ $login = moi ] || [ $login = darius.morel@epitech.eu ]; then
    echo -e "C'est parti pour cloner un repo perso !\n"
    git clone git@git.epitech.eu:/darius.morel@epitech.eu/$nomrepo
else
    echo -e "Clonons un repo d'un copain !\n"
    git clone git@git.epitech.eu:/$login/$nomrepo
fi
