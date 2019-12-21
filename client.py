#!/usr/bin/env python3
# -*- coding:utf-8 -*-
from hashlib import sha256
import requests
import json


def mine(blocks=10):
    url = "http://localhost:5000/mine"
    for i in range(blocks):
        r = requests.get(url)
        yield r.json()


def chain():
    url = "http://localhost:5000/chain"
    r = requests.get(url)
    return r.json()


def check_proof():
    _chain = chain()
    previous = _chain["chain"][-2]["proof"]
    latest = _chain["chain"][-1]["proof"]
    proof_str = f"{previous}{latest}".encode()
    result = sha256(proof_str).hexdigest()
    if result[:5] == "12345":
        return True
    else:
        return False


def main():
    print(check_proof())


if __name__ == "__main__":
    main()
