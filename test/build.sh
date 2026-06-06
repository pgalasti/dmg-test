#!/bin/bash

# Assemble
rgbasm -Werror -Weverything -o test.o test.asm

# Link 
rgblink --dmg --tiny -o test.gb test.o

# Required Post link fix
# Title must be undeer 11 characters
rgbfix --title paul-test --pad-value 0 --validate test.gb

echo "ROM Built"
echo "Maybe quick check context with heapdump -C test.gb?"
