#!/bin/bash

pbase='/home/kenshiro/base/norm/*'
pmath='/home/kenshiro/base/math/*'
psfml='/home/kenshiro/base/csfml/*'

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

read -p "Une autre permission ? " right
while [ $right != "non" ]; do
    blih -u darius.morel@epitech.eu repository setacl "$nomrepo" "$right" rw
    loop "setacl" "$right" "rw"
    echo -e "Permission accordée à : " "$right"
    read -p "Une autre permission ? " right
done


echo -e  "\nRepo créé le " && date "+%d/%m/%Y"
echo "     à"
date "+%Hh%Mm et %Ss"


echo "Affichage des permissions : Tape ton mot de passe ! "
blih -u darius.morel@epitech.eu repository getacl "$nomrepo"

git clone git@git.epitech.eu:/darius.morel@epitech.eu/"$nomrepo"

read -p "Quel type de repo dois-je faire ? " type

if [ $type = "base" ]; then
    cp -r $pbase $nomrepo
    echo -e "Copie de la base dans le repo"
elif [ $type = "math" ]; then
    cp -r $pmath $nomrepo
    echo -e "Copie de la base des math"
elif [ $type = "csfml" ]; then
    cp -r $psfml $nomrepo
    echo -e "Copie de la base de la CSFML"
else
    echo -e "Ok rien de spécial"
fi
