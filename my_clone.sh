#!/bin/bash

clear
echo -e "Ok commençons à cloner !\n"
read -p "Qui est le propriétaire du repo (login sans @) ? " login
read -p "Et le nom du repo ? " nomrepo

if [ $login = moi ] || [ $login = darius.morel ]; then
    echo -e "C'est parti pour cloner un repo perso !\n"
    git clone git@git.epitech.eu:/darius.morel@epitech.eu/$nomrepo
else
    echo -e "Clonons un repo d'un copain !\n"
    git clone git@git.epitech.eu:/$login@epitech.eu/$nomrepo
fi

echo -e "Fin du clonage !"