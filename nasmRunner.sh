#!/bin/bash
if [[ "$1" == "-d" ]]; then
    #nasm "$2.asm" -o "$2.text"
    nasm -felf64 "$2.asm" -o "$2.o"
    objcopy --dump-section .text="$2.text" "$2.o"
    rm "$2.o"
else 
    nasm -felf64 "$1.asm" -o "$1.o"
    ld "$1.o" -o "exec"
    rm "$1.o"
fi