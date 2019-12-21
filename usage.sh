
## Mine a block
curl "http://localhost:5000/mine"

## Look at the full chain
curl "http://localhost:5000/chain"

## Make a new transaction
curl -X POST -H "Content-Type: application/json" -d '{"sender": "d4ee26eee15148ee92c6cd394edd974e", "recipient": "someone-other-address", "amount": 5}' "http://localhost:5000/transactions/new"

## Register new nodes to resolve
curl -X POST -H "Content-Type: application/json" -d '{"nodes": ["http://localhost:5001/", "http://localhost:5002/"]}' "http://localhost:5000/nodes/register"

## Resolve other nodes to see who has authoritative chain
curl "http://localhost:5000/nodes/resolve"
