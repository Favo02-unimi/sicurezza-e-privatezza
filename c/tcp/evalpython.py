inn = open("inn", "w")
out = open("out", "r")

while(True):
    line = out.readline()
    print(line, end='')
    if ("CHALLENGE" in line):
        expr = line[48:]
        print("expr to evaluate:", expr)
        res = eval(expr)
        print("evaluated:", res)

        inn.write(str(res) + "\n")
        inn.flush()
