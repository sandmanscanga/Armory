#!/usr/bin/env python3
# -*- coding:utf-8 -*-
from flask import Flask, jsonify, request, redirect, url_for
from block_chain import Blockchain
from uuid import uuid4

app = Flask(__name__)
node_id = str(uuid4()).replace("-", "")
blockchain = Blockchain()


@app.route("/")
def home():
    return redirect(url_for("full_chain"))

@app.route("/chain", methods=["GET"])
def full_chain():
    response = {
        "chain": blockchain.chain,
        "length": len(blockchain.chain)
    }
    return (jsonify(response), 200)


@app.route("/mine", methods=["GET"])
def mine():
    last_block = blockchain.last_block
    last_proof = last_block["proof"]
    proof = blockchain.proof_of_work(last_proof)
    blockchain.new_transaction("0", node_id, 1)
    block = blockchain.new_block(proof)
    response = {
        "message": "A new block has been mined!",
        "index": block["index"],
        "transactions": block["transactions"],
        "proof": block["proof"],
        "last_hash": block["last_hash"]
    }
    return (jsonify(response), 200)


@app.route("/transaction", methods=["POST"])
def new_transaction():
    values = request.get_json()
    if set(values.keys()) != {"sender", "recipient", "amount"}:
        return ("Missing values", 400)
    index = blockchain.new_transaction(**values)
    response = {"message": f"Transaction will be added to Block {index}"}
    return (jsonify(response), 201)


@app.route('/nodes/register', methods=['POST'])
def register_nodes():
    values = request.get_json()
    nodes = values.get('nodes')
    if nodes is None:
        return "Error: Please supply a valid list of nodes", 400
    for node in nodes:
        blockchain.register_node(node)
    response = {
        'message': 'New nodes have been added',
        'total_nodes': list(blockchain.nodes),
    }
    return (jsonify(response), 201)


@app.route('/nodes/resolve', methods=['GET'])
def consensus():
    replaced = blockchain.resolve_conflicts()
    if replaced:
        response = {
            'message': 'Our chain was replaced',
            'new_chain': blockchain.chain
        }
    else:
        response = {
            'message': 'Our chain is authoritative',
            'chain': blockchain.chain
        }
    return (jsonify(response), 200)


def main():
    app.run(host='0.0.0.0', port=5000, debug=False)


if __name__ == "__main__":
    main()
