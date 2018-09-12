#!/bin/bash

json=$(curl -s -X POST -H "Content-Type: application/json" --data '{"jsonrpc": "2.0", "id": 1, "method": "eth_blockNumber", "params": []}' "https://ropsten.infura.io/v3/31d279db248f4ce1a055deb24b380e21")
hexa=$(echo $json | gawk 'match($0, /result":"0x(\w+)"/, a) {print a[1]}')
dec=$(echo "ibase=16; ${hexa^^}" | bc)
echo "Current block Number in hexadecimal: $hexa"
echo "Current block Number in decimal: $dec"

