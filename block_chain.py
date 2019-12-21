#!/usr/bin/env python3
# -*- coding:utf-8 -*-
from urllib.parse import urlparse
from time import time
import requests
import hashlib
import json

PROOF_STRING = "12345"


class Blockchain(object):

    def __init__(self):
        self.chain = []
        self.transactions = []
        self.nodes = set()
        self.new_block(last_hash=1, proof=100)

    def new_block(self, proof, last_hash=None):
        block = {
            "index": len(self.chain) + 1,
            "timestamp": time(),
            "transactions": self.transactions,
            "proof": proof,
            "last_hash": last_hash or self.hash(self.chain[-1])
        }
        self.transactions = []
        self.chain.append(block)
        return block

    @staticmethod
    def hash(block):
        block_str = json.dumps(block, sort_keys=True).encode()
        return hashlib.sha256(block_str).hexdigest()

    def new_transaction(self, sender, recipient, amount):
        self.transactions.append({
            "sender": sender,
            "recipient": recipient,
            "amount": amount
        })
        return self.last_block["index"] + 1

    @property
    def last_block(self):
        return self.chain[-1]
    
    def proof_of_work(self, last_proof):
        proof = 0
        while self.valid_proof(last_proof, proof) is False:
            proof += 11
        return proof

    @staticmethod
    def valid_proof(last_proof, proof):
        proof_bytes = f"{last_proof}{proof}".encode()
        proof_hash = hashlib.sha256(proof_bytes).hexdigest()
        return proof_hash[:len(PROOF_STRING)] == PROOF_STRING

    def register_node(self, url):
        url_comp = urlparse(url)
        node = url_comp.netloc
        self.nodes.add(node)

    def consensus_algorithm(self):
        neighbors = self.nodes
        new_chain = None
        max_length = len(self.chain)
        for node in neighbors:
            r = requests.get(f"http://{node}/chain")
            if r.status_code == 200:
                length = r.json()["length"]
                chain = r.json()["chain"]
                if length > max_length and self.valid_chain(chain):
                    max_length = length
                    new_chain = chain
        if new_chain:
            self.chain = new_chain
            return True
        return False

    def valid_chain(self, chain):
        last_block = chain[0]
        current_index = 1
        while current_index < len(chain):
            block = chain[current_index]
            print(f"{last_block}")
            print(f"{block}")
            print("\n"+("-"*40)+"\n")
            if block["last_hash"] != self.hash(last_block):
                return False
            if not self.valid_proof(last_block["proof"], block["proof"]):
                return False
            last_block = block
            current_index += 1
        return True
