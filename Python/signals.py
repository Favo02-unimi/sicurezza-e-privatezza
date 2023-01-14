import subprocess, os

# terminal 1:
#       python process.py

# terminal 2:
#       python signals.sh
#       ./signals.sh

pid = input("PID:")

# string too long, broken in 2 inputs
signals = input("signals:")
signals = signals.replace("'", "")
signals = signals.replace(" ", "")
signals = signals.split(",")

f = open("signals.sh", "a")
f.write("#!/bin/bash\n")
for signal in signals:
        kill = "kill -s " + signal + " " + pid 
        f.write(kill + "\n")
        f.write("sleep .1\n")

# string too long, broken in 2 inputs
signals = input("signals2:")
signals = signals.replace("'", "")
signals = signals.replace(" ", "")
signals = signals.split(",")

for signal in signals:
        kill = "kill -s " + signal + " " + pid 
        f.write(kill + "\n")
        f.write("sleep .1\n")
        
