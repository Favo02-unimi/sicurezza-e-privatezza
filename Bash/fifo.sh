#!/bin/bash

# create in, out
# mkfifo in
# mkfifo out

# terminal 1:
# cat - > in

# terminal 2:
# ./fifo.sh
/challenge/embryoio_level93 < ./in > ./out

# terminal 3:
#cat out