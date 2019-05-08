#!/bin/bash

find . -name "*~" -delete -o -name "*#*" -delete -o -name "vgcore.*" -delete
if [ $# = 1 ] && [ $1 = "-v" ]; then
    rm -rf ".vscode" ".dist"
fi