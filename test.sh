
#init
openssl rand -hex 32 > privkey.hex
export PRIVKEY=`cat privkey.hex | awk '{print $1}'`
perl -pi -e "s/PRIVKEY/$PRIVKEY/" config.yaml
pyethapp -d . --password ./password.txt account new 


###run

#test
pyethapp -l :error -d ~/Desktop/Ethereum/linyize/localnet/test --log-file ~/Desktop/Ethereum/linyize/localnet/test/log.txt run

#bootstrap
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/boot --unlock 1 --validate 1 --deposit 2000 -m 0 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/boot/log.txt run

#pos
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node2 --unlock 1 --validate 1 --deposit 2000 -m 0 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node2/log.txt run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node3 --unlock 1 --validate 1 --deposit 2000 -m 0 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node3/log.txt run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node4 --unlock 1 --validate 1 --deposit 2000 -m 0 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node4/log.txt run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node5 --unlock 1 --validate 1 --deposit 2000 -m 0 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node5/log.txt run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node6 --unlock 1 --validate 1 --deposit 2000 -m 0 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node6/log.txt run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node7 --unlock 1 --validate 1 --deposit 2000 -m 0 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node7/log.txt run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node8 --unlock 1 --validate 1 --deposit 2000 -m 0 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node8/log.txt run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node9 --unlock 1 --validate 1 --deposit 2000 -m 0 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node9/log.txt run



#miner
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node1 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node1/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node2 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node2/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node3 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node3/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node4 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node4/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node5 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node5/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node6 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node6/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node7 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node7/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node8 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node8/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node9 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info,eth.sync:debug,eth.pb.msg:debug --log-file ~/Desktop/Ethereum/linyize/localnet/node9/log.txt --unlock 1 run


# test transaction
from web3 import Web3, HTTPProvider
from ethereum.transactions import Transaction
from ethereum.utils import privtoaddr, encode_hex
import sys
import rlp

faucetPrivkey = '042d03aee80224434c34af66afc84793952646d20dc4151b1d1b26eb2629130d'
faucetAddress = encode_hex(privtoaddr(faucetPrivkey))
recipAddress = '1ce8993044331ccf9769e8408d174e8d614909f0'
provider_uri = 'http://127.0.0.1:8545'

web3 = Web3(HTTPProvider(provider_uri))

web3.eth.getBalance(faucetAddress)
web3.eth.getBalance(recipAddress)

nonce = web3.eth.getTransactionCount(faucetAddress)
tx = Transaction(nonce, 100*10**9, 25*10**3, recipAddress, 5000*10**18, '').sign(faucetPrivkey)
txraw = rlp.hex_encode(tx)
txid = web3.eth.sendRawTransaction(txraw)
#web3.eth.getTransactionReceipt(txid)

web3.eth.getBalance(faucetAddress)
web3.eth.getBalance(recipAddress)

# fix gasprice problem
cd docker-pyeth-dev/
git pull
docker-compose build
docker cp utils/faucet_util.py bootstrap:/ethereum/
docker cp bootstrap/data/config bootstrap:/root/.config/pyethapp
docker cp miner/default_data/config miner:/root/.config/pyethapp




bootstrap    | INFO:eth.validator	Attempting to vote 
bootstrap    | TypeError: can't concat NoneType to bytes
bootstrap    | <Greenlet at 0x7fc9d5f50768: <bound method ChainService._add_blocks of <ChainService at 0x7fc9d6bbf638>>> failed with TypeError
bootstrap    | 
bootstrap    | Traceback (most recent call last):
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/gevent-1.1.0-py3.6-linux-x86_64.egg/gevent/greenlet.py", line 534, in run
bootstrap    |     result = self._run(*self.args, **self.kwargs)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/eth_service.py", line 339, in _add_blocks
bootstrap    |     if self.chain.add_block(block):
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/chain.py", line 202, in add_block
bootstrap    |     self.set_head(block)
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/chain.py", line 179, in set_head
bootstrap    |     self.new_head_cb(block)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/eth_service.py", line 203, in _on_new_head
bootstrap    |     cb(block)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/validator_service.py", line 75, in on_new_head
bootstrap    |     self.handlers[self.current_state](casper)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/validator_service.py", line 152, in vote
bootstrap    |     source_epoch, self.coinbase.privkey)
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/casper_utils.py", line 76, in mk_vote
bootstrap    |     v, r, s = utils.ecdsa_raw_sign(sighash, key)
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/py_ecc-1.4.2-py3.6.egg/py_ecc/secp256k1/secp256k1.py", line 131, in ecdsa_raw_sign
bootstrap    |     k = deterministic_generate_k(msghash, priv)
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/py_ecc-1.4.2-py3.6.egg/py_ecc/secp256k1/secp256k1.py", line 120, in deterministic_generate_k
bootstrap    |     k = hmac.new(k, v + b'\x00' + priv + msghash, hashlib.sha256).digest()
bootstrap    | TypeError: can't concat NoneType to bytes
bootstrap    | <Greenlet at 0x7fc9d5cabe88: <bound method ChainService._add_blocks of <ChainService at 0x7fc9d6bbf638>>> failed with TypeError
bootstrap    | 
bootstrap    | Traceback (most recent call last):
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/gevent-1.1.0-py3.6-linux-x86_64.egg/gevent/greenlet.py", line 534, in run
bootstrap    |     result = self._run(*self.args, **self.kwargs)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/eth_service.py", line 339, in _add_blocks
bootstrap    |     if self.chain.add_block(block):
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/chain.py", line 202, in add_block
bootstrap    |     self.set_head(block)
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/chain.py", line 179, in set_head
bootstrap    |     self.new_head_cb(block)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/eth_service.py", line 203, in _on_new_head
bootstrap    |     cb(block)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/validator_service.py", line 75, in on_new_head
bootstrap    |     self.handlers[self.current_state](casper)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/validator_service.py", line 152, in vote
bootstrap    |     source_epoch, self.coinbase.privkey)
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/casper_utils.py", line 76, in mk_vote
bootstrap    |     v, r, s = utils.ecdsa_raw_sign(sighash, key)
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/py_ecc-1.4.2-py3.6.egg/py_ecc/secp256k1/secp256k1.py", line 131, in ecdsa_raw_sign
bootstrap    |     k = deterministic_generate_k(msghash, priv)
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/py_ecc-1.4.2-py3.6.egg/py_ecc/secp256k1/secp256k1.py", line 120, in deterministic_generate_k
bootstrap    |     k = hmac.new(k, v + b'\x00' + priv + msghash, hashlib.sha256).digest()
bootstrap    | TypeError: can't concat NoneType to bytes
bootstrap    | <Greenlet at 0x7fc9d5cabf20: <bound method ChainService._add_blocks of <ChainService at 0x7fc9d6bbf638>>> failed with TypeError
bootstrap    | 
bootstrap    | Traceback (most recent call last):
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/gevent-1.1.0-py3.6-linux-x86_64.egg/gevent/greenlet.py", line 534, in run
bootstrap    |     result = self._run(*self.args, **self.kwargs)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/eth_service.py", line 339, in _add_blocks
bootstrap    |     if self.chain.add_block(block):
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/chain.py", line 202, in add_block
bootstrap    |     self.set_head(block)
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/chain.py", line 179, in set_head
bootstrap    |     self.new_head_cb(block)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/eth_service.py", line 203, in _on_new_head
bootstrap    |     cb(block)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/validator_service.py", line 75, in on_new_head
bootstrap    |     self.handlers[self.current_state](casper)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/validator_service.py", line 152, in vote
bootstrap    |     source_epoch, self.coinbase.privkey)
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/casper_utils.py", line 76, in mk_vote
bootstrap    |     v, r, s = utils.ecdsa_raw_sign(sighash, key)
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/py_ecc-1.4.2-py3.6.egg/py_ecc/secp256k1/secp256k1.py", line 131, in ecdsa_raw_sign
bootstrap    |     k = deterministic_generate_k(msghash, priv)
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/py_ecc-1.4.2-py3.6.egg/py_ecc/secp256k1/secp256k1.py", line 120, in deterministic_generate_k
bootstrap    |     k = hmac.new(k, v + b'\x00' + priv + msghash, hashlib.sha256).digest()
bootstrap    | TypeError: can't concat NoneType to bytes
bootstrap    | <Greenlet at 0x7fc9d6165df0: <bound method ChainService._add_blocks of <ChainService at 0x7fc9d6bbf638>>> failed with TypeError
bootstrap    | 
bootstrap    | Traceback (most recent call last):
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/gevent-1.1.0-py3.6-linux-x86_64.egg/gevent/greenlet.py", line 534, in run
bootstrap    |     result = self._run(*self.args, **self.kwargs)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/eth_service.py", line 339, in _add_blocks
bootstrap    |     if self.chain.add_block(block):
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/chain.py", line 202, in add_block
bootstrap    |     self.set_head(block)
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/chain.py", line 179, in set_head
bootstrap    |     self.new_head_cb(block)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/eth_service.py", line 203, in _on_new_head
bootstrap    |     cb(block)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/validator_service.py", line 75, in on_new_head
bootstrap    |     self.handlers[self.current_state](casper)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/validator_service.py", line 152, in vote
bootstrap    |     source_epoch, self.coinbase.privkey)
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/casper_utils.py", line 76, in mk_vote
bootstrap    |     v, r, s = utils.ecdsa_raw_sign(sighash, key)
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/py_ecc-1.4.2-py3.6.egg/py_ecc/secp256k1/secp256k1.py", line 131, in ecdsa_raw_sign
bootstrap    |     k = deterministic_generate_k(msghash, priv)
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/py_ecc-1.4.2-py3.6.egg/py_ecc/secp256k1/secp256k1.py", line 120, in deterministic_generate_k
bootstrap    |     k = hmac.new(k, v + b'\x00' + priv + msghash, hashlib.sha256).digest()
bootstrap    | TypeError: can't concat NoneType to bytes
bootstrap    | <Greenlet at 0x7fc9d5f50768: <bound method ChainService._add_blocks of <ChainService at 0x7fc9d6bbf638>>> failed with TypeError
bootstrap    | 
bootstrap    | Traceback (most recent call last):
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/gevent-1.1.0-py3.6-linux-x86_64.egg/gevent/greenlet.py", line 534, in run
bootstrap    |     result = self._run(*self.args, **self.kwargs)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/eth_service.py", line 339, in _add_blocks
bootstrap    |     if self.chain.add_block(block):
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/chain.py", line 202, in add_block
bootstrap    |     self.set_head(block)
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/chain.py", line 179, in set_head
bootstrap    |     self.new_head_cb(block)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/eth_service.py", line 203, in _on_new_head
bootstrap    |     cb(block)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/validator_service.py", line 75, in on_new_head
bootstrap    |     self.handlers[self.current_state](casper)
bootstrap    |   File "/ethereum/pyethapp/pyethapp/validator_service.py", line 152, in vote
bootstrap    |     source_epoch, self.coinbase.privkey)
bootstrap    |   File "/ethereum/pyethereum/ethereum/hybrid_casper/casper_utils.py", line 76, in mk_vote
bootstrap    |     v, r, s = utils.ecdsa_raw_sign(sighash, key)
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/py_ecc-1.4.2-py3.6.egg/py_ecc/secp256k1/secp256k1.py", line 131, in ecdsa_raw_sign
bootstrap    |     k = deterministic_generate_k(msghash, priv)
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/py_ecc-1.4.2-py3.6.egg/py_ecc/secp256k1/secp256k1.py", line 120, in deterministic_generate_k
bootstrap    |     k = hmac.new(k, v + b'\x00' + priv + msghash, hashlib.sha256).digest()
bootstrap    | TypeError: can't concat NoneType to bytes
bootstrap    | <Greenlet at 0x7fc9d61656d0: <bound method ChainService._add_blocks of <ChainService at 0x7fc9d6bbf638>>> failed with TypeError
bootstrap    | 
bootstrap    | Traceback (most recent call last):
bootstrap    |   File "/usr/local/lib/python3.6/dist-packages/gevent-1.1.0-py3.6-linux-x86_64.egg/gevent/greenlet.py", line 534, in run
bootstrap    |     result = self._run(*self.args, **self.kwargs)
miner        | INFO:pow.subprocess	nonce found 
miner        | INFO:pow.subprocess	sending nonce 
miner        | INFO:pow	nonce found: 7b7df74b16fd0fd33ed00b560e2300629c984e6620ff585cf04e7a4c263b34c5 
miner        | INFO:eth.block	Block pre-sealed, 0 gas used 
miner        | WARNING:pow	mining_hash does not match 
bootstrap    | INFO:eth.block	Adding transactions, 2 in txqueue, 0 dunkles 
bootstrap    | ERROR:eth.block	<Transaction(a48a)>: 'balance' actual:3000970761023004005006 target:3001970761023004005006 
bootstrap    | ERROR:eth.block	<Transaction(5473)>: 'balance' actual:3000970761023004005006 target:3001970761023004005006 
bootstrap    | INFO:eth.block	Added 0 transactions 
bootstrap    | INFO:eth.block	Block pre-sealed, 0 gas used 
