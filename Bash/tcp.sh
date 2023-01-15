#!/bin/bash

exec 3<>/dev/tcp/127.0.0.1/1356

while read line; do
    echo $line;
    if [[ "$line" == *"CHALLENGE!"* ]]; then
        len=${#line}
        len=$(($len-48))
        expr=${line:48:len}
        echo "-----"
        echo "$expr"
        echo "-----"
        res=$(( $expr ))
        echo $res >&3
    fi
done <&3