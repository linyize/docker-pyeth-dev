
#init
openssl rand -hex 32 > privkey.hex
export PRIVKEY=`cat privkey.hex | awk '{print $1}'`
perl -pi -e "s/PRIVKEY/$PRIVKEY/" config.yaml
pyethapp -d . --password ./password.txt account new 


###run

#test
pyethapp -l :error -d ~/Desktop/Ethereum/linyize/localnet/test --log-file ~/Desktop/Ethereum/linyize/localnet/test/log.txt run

#bootstrap
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/boot --unlock 1 --validate 1 --deposit 2000 -m 0 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/boot/log.txt run

#miner
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node1 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/node1/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node2 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/node2/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node3 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/node3/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node4 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/node4/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node5 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/node5/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node6 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/node6/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node7 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/node7/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node8 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/node8/log.txt --unlock 1 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/node9 -m 100 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/node9/log.txt --unlock 1 run


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

