import hashlib
import datetime


class Block:
   

    def __init__(s, i, n1, n2, ph):
        s.i = i
        s.t = str(datetime.datetime.now())
        s.n1 = n1
        s.n2 = n2
        s.r = s.check()
        s.ph = ph
        s.h = s.calhash()

    def calhash(s):
        data = str(s.i) + s.t + str(s.n1) + str(s.n2) + str(s.r) + str(s.ph)
        return hashlib.sha256(data.encode()).hexdigest()

    def check(s):
        if sorted(s.n1.lower()) == sorted(s.n2.lower()):
            return "Anagram"
        else:
            return "Not Anagram"


class Blockchain:

    def __init__(s):
        s.chain = [s.createGBlock()]

    def createGBlock(s):
        return Block(0, "0", "0", "0")

    def addBlock(s, n1, n2):
        ph = s.chain[-1].h
        b = Block(len(s.chain), n1, n2, ph)
        s.chain.append(b)

    def disp(s):
        for b in s.chain:
            print("Block:", b.i)
            print("Timestamp:", b.t)
            print("First word:", b.n1)
            print("Second word:", b.n2)
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
p.addBlock("undertale", "deltarune")
p.addBlock("lal", "lal")
p.addBlock("hello", "world")
p.disp()
print("Chain valid:", p.is_valid())