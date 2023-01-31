#!/bin/bash

if [[ "$1" == "-d" ]]; then
    nasm "$2" -o "text"
elif [[ "$1" == "-o" ]]; then
	nasm "$2" -o "text" && cat "text" && rm "text"
elif [[ "$1" == "-g" ]]; then
    gcc -nostdlib -o "exec" "$2"
elif [[ "$1" == "-go" ]]; then
    gcc -nostdlib -o "exec" "$2" && objcopy --dump-section .text="text" "./exec"
elif [[ "$1" == "-gom" ]]; then
    gcc -nostdlib -o "exec" "$2" && objcopy --dump-section .text="text" "./exec"
    rm merge
    echo "$3" > merge
    echo "\n" >> merge
    cat text >> merge
elif [[ "$1" == "-gow" ]]; then
    gcc -Wl,-N --static -nostdlib -o "exec" "$2" && objcopy --writable-text --dump-section .text="text" "./exec"
else
    nasm -f elf64 "$1" -o "exec.o"
    ld "exec.o" -o "exec"
    rm "exec.o"
fi