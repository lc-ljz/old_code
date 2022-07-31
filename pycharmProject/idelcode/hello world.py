a="HELLO WORLD "
n=0
s=""
for i in a:
    s=s+i

    if n==1:
        print(s)
        s=""
        n=0
        continue
    n=n+1
input()
