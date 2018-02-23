from web3 import Web3, HTTPProvider
from ethereum.transactions import Transaction
from ethereum.utils import privtoaddr, encode_hex
import sys
import rlp

print('Generating faucet tx')

faucetPrivkey = sys.argv[1]
faucetAddress = encode_hex(privtoaddr(faucetPrivkey))
recipAddress = sys.argv[2]
provider_uri = 'http://' + sys.argv[3] + ':8545'

web3 = Web3(HTTPProvider(provider_uri))

nonce = web3.eth.getTransactionCount(faucetAddress)
tx = Transaction(nonce, 100*10**9, 25*10**3, recipAddress, 5000*10**18, '').sign(faucetPrivkey)
txraw = rlp.hex_encode(tx)
print('Transaction generated')
txid = web3.eth.sendRawTransaction(txraw)
assert txid
print('Transmitted faucet transaction: ' + txid)
