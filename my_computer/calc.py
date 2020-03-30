#!/usr/bin/python

import sys
import math


def combination(n, k):
    return math.factorial(n) / (math.factorial(k) * math.factorial(n - k))


def main():
    txt = ";" + " ".join(sys.argv[1:])
    code, expression = txt.rsplit(";", 1)
    exec(code)
    res = eval(expression)
    print(res)


# Aliases for convenience.
c = combination
f = math.factorial

if __name__ == "__main__":
    main()

