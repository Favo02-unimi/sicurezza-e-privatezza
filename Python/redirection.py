import subprocess, os

with open("covwsb", "r") as infile:
    subprocess.run(["/challenge/embryoio_level78"], stdin=infile)