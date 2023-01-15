#!/bin/bash

# start all 3 math-*.sh scripts

while read line; do
    echo "$line"
    if [[ "$line" == *"CHALLENGE!"* ]]; then
        len=${#line}
        len=$(($len-48))
        expr=${line:48:len}
        echo "-----"
        echo "$expr"
        echo "-----"

        #res=$(( $expr ))
        #   sometimes the calculated res is wrong
        #   the same expr calculated using python eval or
        #   using shell (( )) gives different results
        
        python ./evalpython.py "$expr" > fifoin

        # echo "$res"
        # echo "-----"
        # echo $res > fifoin
    fi
done < <( cat fifoout )
