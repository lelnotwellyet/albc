import hashlib
import datetime


class Block:
    print("\nDeveloped By Raj 31011123063")

    def __init__(s, i, n, ph):
        s.i = i
        s.t = str(datetime.datetime.now())
        s.n = n
        s.r = s.check()
        s.ph = ph
        s.h = s.calhash()

    def calhash(s):
        data = str(s.i) + s.t + str(s.n) + str(s.r) + str(s.ph)
        return hashlib.sha256(data.encode()).hexdigest()

    def check(s):
        n = s.n
        l = len(str(n))
        total = 0
        while n != 0:
            r = n % 10
            total = total + r ** l
            n = n // 10
        if s.n == total:
            return "Armstrong number"
        else:
            return "not Armstrong number"


class Blockchain:

    def __init__(s):
        s.chain = [s.createGBlock()]

    def createGBlock(s):
        return Block(0, 0, "0")

    def addBlock(s, n):
        ph = s.chain[-1].h
        b = Block(len(s.chain), n, ph)
        s.chain.append(b)

    def disp(s):
        for b in s.chain:
            print("Block:", b.i)
            print("Timestamp:", b.t)
            print("Original number:", b.n)
            print("Result:", b.r)
            print("Previous hash:", b.ph)
            print("Current Hash:", b.h)
            print("-" * 45)

    def is_valid(s):
        for idx in range(1, len(s.chain)):
            cur = s.chain[idx]
            prev = s.chain[idx - 1]
            if cur.h != cur.calhash():
                return False
            if cur.ph != prev.h:
                return False
        return True


p = Blockchain()
p.addBlock(12)
p.addBlock(153)
p.addBlock(1652)
p.disp()
print("Chain valid:", p.is_valid())