#!/bin/bash
set -e

# Assemble
rgbasm -Werror -Weverything -o main.o main.asm
rgbasm -Werror -Weverything -o tile-test.o tile-test.asm

# Link 
rgblink --dmg --tiny --map tile-test.map --sym tile-test.sym -o tile-test.gb main.o tile-test.o
rgbfix --title game --pad-value 0 --validate tile-test.gb

echo "ROM Built"
