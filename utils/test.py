from web3 import Web3, HTTPProvider
from ethereum.transactions import Transaction
from ethereum.utils import privtoaddr, encode_hex
import sys
import rlp
import time
import random

print('Generating faucet tx')

faucetPrivkey = '035ec487c47b71f129efe93b64a69e8b398a3217fd30b049aaaed2ddcd9c387e'
faucetAddress = encode_hex(privtoaddr(faucetPrivkey))
recipAddress = '494c89fc4608d5529c31d3c33bbdb4e5d0e960fd'
provider_uri = 'http://127.0.0.1:8545'

web3 = Web3(HTTPProvider(provider_uri))

balance = web3.eth.getBalance(faucetAddress)
print 'faucetAddress: ' + str(balance)

balance = web3.eth.getBalance(recipAddress)
print 'recipAddress: ' + str(balance)

nonce = web3.eth.getTransactionCount(faucetAddress)
#tx = Transaction(nonce, 100*10**9, 25*10**3, recipAddress, 1*10**18, '').sign(faucetPrivkey)
tx = Transaction(nonce, 100*10**9, 25*10**3, recipAddress, random.randint(1, 100), '').sign(faucetPrivkey)
txraw = rlp.hex_encode(tx)
print('Transaction generated')
txid = web3.eth.sendRawTransaction(txraw)
assert txid
print('Transmitted faucet transaction: ' + txid)
receipt = web3.eth.getTransactionReceipt(txid)
sec = 0
while receipt == None:
	time.sleep(1)
	sec += 1
	receipt = web3.eth.getTransactionReceipt(txid)
	print sec
	pass
print('Transmitted faucet transaction: ' + str(receipt) )
