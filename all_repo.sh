#!/bin/bash

if [ $# != 0 ]; then
    echo -e "Pas de besoin d'arguments pour utiliser ce script !\n\n"
fi

read -p "Entrez votre login Epitech (sans @): " login

echo "Entrez votre mot passe Epitech !"
blih -u $login@epitech.eu repository list > list_repo

while read repo ; do
echo -e "Clone de $repo"
git clone git@git.epitech.eu:/$login@epitech.eu/$repo
echo -e "$repo cloné avec succés !"
done < list_repo

echo -e "Tout les repos ont été cloné avec succés !"
read -p "Press enter to clear !" wait
clear