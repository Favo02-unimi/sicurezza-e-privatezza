import subprocess, os

# mkfifo in
# mkfifo out

# terminal 1:
#   cat - > in

# terminal 2:
#   python fifo.py

# terminal 3:
#   cat out


with open("in", "r") as infifo:
    with open("out", "w") as outfifo:
        subprocess.run(["/challenge/embryoio_level106"], stdin=infifo, stdout=outfifo)