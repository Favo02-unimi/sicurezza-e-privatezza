import subprocess

cmd = "/challenge/embryoio_level134"

cat1 = subprocess.Popen(["cat", "-"], stdout=subprocess.PIPE, stdin=subprocess.PIPE)
p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stdin=cat1.stdout, universal_newlines=True)
cat2 = subprocess.Popen(["cat"], stdin=p.stdout, stdout=subprocess.PIPE, universal_newlines=True)

for line in cat2.stdout:
    print(line, end='')
    if ("CHALLENGE" in line):
        expr = line[48:]
        print("expr to evaluate:", expr)
        res = eval(expr)
        print("evaluated:", res)
        cat1.stdin.write((str(res) + "\n").encode())
        cat1.stdin.flush()
        print("output:", cat2.stdout.readline())