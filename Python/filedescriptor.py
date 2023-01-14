import subprocess, os

# exec 242<> ./file     # open fd 242

with open(2, "r") as infile:
    subprocess.run(["/challenge/embryoio_level107"], stdin=infile, close_fds=False)
    infile.close()