#!/bin/bash

# Assemble
rgbasm -Werror -Weverything -o test.o test.asm

# Link 
rgblink --dmg --tiny -o test.gb test.o

# Required Post link fix
rgbfix --title paul-test --pad-value 0 --validate test.gb

