import subprocess, os

cat = subprocess.Popen(["cat", "in.txt", "-"], stdout=subprocess.PIPE)
rev = subprocess.Popen(["rev"], stdout=subprocess.PIPE, stdin=cat.stdout)
rev2 = subprocess.Popen(["rev"], stdout=subprocess.PIPE, stdin=rev.stdout)
embry = subprocess.run(["/challenge/embryoio_level59"], stdin=rev2.stdout)