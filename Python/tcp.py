import socket

HOST = "127.0.0.1"
PORT = 1927

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))
while True:
    data = s.recv(1024)
    if not data:
        break
    print(data)

    if ("CHALLENGE" in str(data)):
        index = str(data).index("CHALLENGE") + 40
        expr = str(data)[index:]
        expr = expr[:-3]
        expr2 = expr.replace("\n", " ")
        print("expr to evaluate:", expr2)
        res = eval(expr2)
        print("evaluated:", res)

        resBytes = str.encode(str(res) + "\n")
        s.send(resBytes)
