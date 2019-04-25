#!/usr/bin/env bash

clear
echo -e "Créons un nouvel alias !\n"

read -p "Entrez le nom de l'alias : " nalias
read -p "Entrez la commande de l'alias : " command

echo -e "\nalias $nalias='$command'" >> ~/.zshrc
echo -e "Le nouvel alias a été placé dans le zshrc du home !"

cd
source .zshrc
cd -
echo -e "Le terminal a été actualisé ! Bous pouvez utilisez votre alias dès maintenant !\n"