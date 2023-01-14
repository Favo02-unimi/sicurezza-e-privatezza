import subprocess

cmd = "/challenge/embryoio_level131"

p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stdin=subprocess.PIPE, universal_newlines=True)

for line in p.stdout:
    print(line, end='')
    if ("CHALLENGE" in line):
        expr = line[48:]
        print("expr to evaluate:", expr)
        res = eval(expr)
        print("evaluated:", res)
        p.stdin.write(str(res) + "\n")
        p.stdin.flush()
        print("output:", p.stdout.readline())