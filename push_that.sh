#!/bin/bash

commit=$*

clear

git add --all
git commit -m "$commit"
git push