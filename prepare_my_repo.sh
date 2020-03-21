#!/bin/bash

if [ $# != 0 ]; then
    nomrepo=$1
else
    echo -e "Il faut mettre un nom de repo sinon ça marche pas"
    exit 84
fi

loop ()
{
    while [ $(echo $?) = 1 ]; do
        echo -e "Mauvais mot de passe"
        if [ $# = 1 ]; then
            blih -u darius.morel@epitech.eu repository "$1" "$nomrepo"
        else
            blih -u darius.morel@epitech.eu repository "$1" "$nomrepo" "$2" "$3"
        fi
    done
}

clear
echo -e "Créons un repo tous ensemble !\n"

echo -e "Création du repo : Tape ton mot de passe ! "
blih -u darius.morel@epitech.eu repository create $nomrepo
loop "create"

echo -e  "\nPermission à Tek : Retape ton mot de passe ! "
blih -u darius.morel@epitech.eu repository setacl "$nomrepo" ramassage-tek r
loop "setacl" "ramassage-tek" "r"

echo
read -p "Une autre permission (login sans @) / (non) ? " right

while [ $right != "non" ]; do
    right=$right@epitech.eu
    blih -u darius.morel@epitech.eu repository setacl "$nomrepo" "$right" rw
    loop "setacl" "$right" "rw"
    echo -e "Permission accordée à : $right\n"
    read -p "Une autre permission (login sans @) / (non) ? " right
done

echo -e "\nAffichage des permissions : Tape ton mot de passe ! "
blih -u darius.morel@epitech.eu repository getacl "$nomrepo"
echo

git clone git@git.epitech.eu:/darius.morel@epitech.eu/"$nomrepo"
echo

read -p "Quel type de repo dois-je faire (base) / (math) / (csfml) ? " type

if [ -z $type ]; then
    echo -e "Ok rien de spécial"
elif [ $type = "base" ]; then

    cp -r ~/base/norm/* $nomrepo
    echo -e "Copie de la base C dans le repo\n"

    read -p "Quel est le nom du binaire à créer ? " nombinaire
    if [ -z $nombinaire ]; then
        echo -e "Ok, on verras ça plus tard !"
    else
        sed -i "s/NAME = .*/NAME = $nombinaire/" ./$nomrepo/src/Makefile
        echo -e "Le binaire s'appelle : $nombinaire"
    fi

elif [ $type = "math" ]; then
    cp -r ~/base/math/* $nomrepo
    echo -e "Copie de la base des math"
elif [ $type = "csfml" ]; then
    cp -r ~/base/csfml/* $nomrepo
    echo -e "Copie de la base de la CSFML"
else
    echo -e "Type inconnue !"
fi

echo
read -p "Press enter to clear !" wait
clear