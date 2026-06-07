#!/bin/bash
set -e

# Assemble
rgbasm -Werror -Weverything -o main.o main.asm
rgbasm -Werror -Weverything -o sample.o sample.asm

# Link 
rgblink --dmg --tiny --map sample.map --sym sample.sym -o sample.gb main.o sample.o
rgbfix --title game --pad-value 0 --validate sample.gb

echo "ROM Built"
