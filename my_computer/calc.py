#!/usr/bin/python

import sys
import math


def factors(n): 
    factors = []
    while n % 2 == 0: 
        factors.append(2) 
        n = n / 2
    for i in range(3, int(math.sqrt(n)) + 1, 2): 
        while n % i== 0: 
            factors.append(i) 
            n = n / i 
    if n > 2: 
        factors.append(n)
    return factors


def combination(n, k):
    return math.factorial(n) / (math.factorial(k) * math.factorial(n - k))


def main():
    txt = "pass;" + " ".join(sys.argv[1:])
    code, expression = txt.rsplit(";", 1)
    exec(code)
    res = eval(expression)
    print(res)


# Aliases for convenience.
c = combination
f = math.factorial

if __name__ == "__main__":
    main()

