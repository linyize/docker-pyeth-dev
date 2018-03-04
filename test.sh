
#init
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/boot --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt account new 

openssl rand -hex 32 > privkey.hex
export PRIVKEY=`cat privkey.hex | awk '{print $1}'`
perl -pi -e "s/PRIVKEY/$PRIVKEY/" config.yaml


pyethapp -d ~/Desktop/Ethereum/linyize/localnet/miner1 --password ~/Desktop/Ethereum/linyize/localnet/miner1/password.txt account new 
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/miner2 --password ~/Desktop/Ethereum/linyize/localnet/miner2/password.txt account new 
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/miner3 --password ~/Desktop/Ethereum/linyize/localnet/miner3/password.txt account new 
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/miner4 --password ~/Desktop/Ethereum/linyize/localnet/miner4/password.txt account new 

pyethapp -d . --password ./password.txt account new 


###run

#test
pyethapp -l :error -d ~/Desktop/Ethereum/linyize/localnet/test --log-file ~/Desktop/Ethereum/linyize/localnet/test/log.txt run

#bootstrap
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/boot --unlock 1 --validate 1 --deposit 2000 -m 0 --password ~/Desktop/Ethereum/linyize/localnet/boot/password.txt -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/boot/log.txt run

#miner
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/miner1 -m 50 -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/miner1/log.txt run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/miner2 -m 50 -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/miner2/log.txt run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/miner3 -m 50 -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/miner3/log.txt run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/miner4 -m 50 -l eth.chain:info,eth.chainservice:info,eth.validator:info --log-file ~/Desktop/Ethereum/linyize/localnet/miner4/log.txt run

#validator
pyethapp -d ~/Desktop/Ethereum/linyize/localnet/val1 -m 0 -l eth.chain:info,eth.chainservice:info,eth.validator:info --password ~/Desktop/Ethereum/linyize/localnet/val1/password.txt --log-file ~/Desktop/Ethereum/linyize/localnet/val1/log.txt --unlock 2  --validate 2 --deposit 2000 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/val2 -m 0 -l eth.chain:info,eth.chainservice:info,eth.validator:info --password ~/Desktop/Ethereum/linyize/localnet/val2/password.txt --log-file ~/Desktop/Ethereum/linyize/localnet/val2/log.txt --unlock 3  --validate 3  --deposit 2000 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/val3 -m 0 -l eth.chain:info,eth.chainservice:info,eth.validator:info --password ~/Desktop/Ethereum/linyize/localnet/val3/password.txt --log-file ~/Desktop/Ethereum/linyize/localnet/val3/log.txt --unlock 4  --validate 4  --deposit 2000 run

pyethapp -d ~/Desktop/Ethereum/linyize/localnet/val4 -m 0 -l eth.chain:info,eth.chainservice:info,eth.validator:info --password ~/Desktop/Ethereum/linyize/localnet/val4/password.txt --log-file ~/Desktop/Ethereum/linyize/localnet/val4/log.txt --unlock 5  --validate 5  --deposit 2000 run

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

