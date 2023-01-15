#!/bin/bash

#expr=$( /challenge/embryoio_level125 )

#echo $expr

while read -r line; do
    echo $line
    if [[ "$line" == *"CHALLENGE!"* ]]; then
        expr=${line:48:2000}
        echo "-----"
        echo $expr
        echo "-----"
        res=$(( $expr ))
        echo $res
        echo "-----"
        echo $res > fifoin
    fi
done < <( /challenge/embryoio_level125 < fifoin > fifoout)