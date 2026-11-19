import hashlib
import datetime


class Block:
    

    def __init__(s, i, acc, typ, amt, bal, ph):
        s.i = i
        s.t = str(datetime.datetime.now())
        s.acc = acc
        s.typ = typ
        s.amt = amt
        s.bal = bal
        s.ph = ph
        s.h = s.calhash()

    def calhash(s):
        data = str(s.i) + s.t + str(s.acc) + str(s.typ) + str(s.amt) + str(s.bal) + str(s.ph)
        return hashlib.sha256(data.encode()).hexdigest()


class Blockchain:

    def __init__(s):
        s.chain = [s.createGBlock()]
        s.balance = 0

    def createGBlock(s):
        return Block(0, "BANK", "GENESIS", 0, 0, "0")

    def deposit(s, acc, amt):
        if amt <= 0:
            print("Invalid Deposit Amount")
            return
        s.balance += amt
        p = s.chain[-1]
        temp = Block(len(s.chain), acc, "DEPOSIT", amt, s.balance, p.h)
        s.chain.append(temp)
        print("Deposit Successful")
        print("Amount Deposited:", amt)
        print("Current Balance:", s.balance)

    def withdraw(s, acc, amt):
        if amt <= 0:
            print("Invalid Withdrawal Amount")
            return
        if amt > s.balance:
            print("Insufficient Balance")
            return
        s.balance -= amt
        p = s.chain[-1]
        temp = Block(len(s.chain), acc, "WITHDRAW", amt, s.balance, p.h)
        s.chain.append(temp)
        print("Withdrawal Successful")
        print("Amount Withdrawn:", amt)
        print("Current Balance:", s.balance)

    def disp(s):
        for b in s.chain:
            print("\nBlock:", b.i)
            print("Timestamp:", b.t)
            print("Account:", b.acc)
            print("Transaction:", b.typ)
            print("Amount:", b.amt)
            print("Balance:", b.bal)
            print("Hash:", b.h)
            print("Previous Hash:", b.ph)
            print(80 * "-")

    def validate(s):
        for i in range(1, len(s.chain)):
            b = s.chain[i]
            p = s.chain[i - 1]
            if b.h != b.calhash():
                return False
            if b.ph != p.h:
                return False
        return True


b = Blockchain()
b.deposit("Raj", 11000)
b.deposit("Raj", 5200)
b.withdraw("Raj", 6700)
b.withdraw("Raj", 900)
b.withdraw("Raj", 1500)
b.disp()

if b.validate():
    print("Blockchain is valid")
else:
    print("Blockchain is not valid")