# Casper Pyethapp Development Environment Containers
This repository provides Docker containers for setting up a local Casper testnet as well
as connecting to remote testnets.

# Dependencies
- `docker`
- `docker-compose`

# Instructions
[Alpha Casper FFG Testnet Instructions](https://hackmd.io/s/Hk6UiFU7z)

# Sync Public Testnet
To sync with a public testnet, you will need to:

1. Clone this repository, 
2. Create or import your keystore, and
3. Start your node! You will need to provide a `bootstrap_node` of the form `enode://[NODE_PUB_KEY]@[NODE_IP_ADDR]:30303`.
The `NODE_PUB_KEY` is your bootstrap node's public key found in the `config.yaml`, and `NODE_IP_ADDR` is its IP address.


```bash
$ git clone git@github.com:linyize/docker-pyeth-dev.git
$ cd docker-pyeth-dev
$ make new-acccount
🌟 Creating keystore directory at ./validator/data/config/keystore
mkdir -p ./validator/data/config/keystore
🌟 Enter a new password to encrypt your account:
🌟 Your password is stored at ./validator/data/config/password.txt
🌟 Pyethapp container is creating new address for you, might take few seconds:

$ make run-node bootstrap_node=enode://[NODE_PUB_KEY]@[NODE_IP_ADDR]:30303
```

In the above example we created a new account. However, if you have a keystore you would like to use
feel free to copy and paste it into `./validator/data/config/keystore`. Note that your account keystore, blockchain, and logs are all stored in `./validator/data`

## Running a Miner
At first, you will have no ETH so you may wish to spend some time mining. To do this simply run your node
with `mine_percent` as any number `1-100`. `mine_percent` specifies the percentage of your CPU you want to
dedicate to mining. For instance, to start a miner using half your CPU you can run:
```bash
$ make run-node mine_percent=50 bootstrap_node=enode://[NODE_PUB_KEY]@[NODE_IP_ADDR]:30303
```

## Running a Validator
Once you have more ETH than the minimum accepted deposit size (currently set to `1500 ETH`), deposit your ETH and
start validating. For instance, your command may look something like:
```bash
$ make run-node validate=true deposit=1501 bootstrap_node=enode://[NODE_PUB_KEY]@[NODE_IP_ADDR]:30303
```

## Logging out and Withdrawing your ETH
If you would like to no longer validate and withdraw your ETH + rewards, you can logout. Note that logging out and 
withdrawing is not instant and will take at least two epochs. If you would like to logout, stop your validator and
then run the following command:
```bash
$ make run-node validate=true logout=true bootstrap_node=enode://[NODE_PUB_KEY]@[NODE_IP_ADDR]:30303
```
You can then watch the logs for `Changing validator state to: [VALIDATOR_STATE]` to see if your validator has
successfully logged out and submitted a withdrawl transaction. You can also use `web3` to check to see if your account
balance has updated to include your deposit plus your hard earned validation rewards.


# Setup Local Testnet
First start up the default bootstrap node & miner with:
```
$ docker-compose build
$ docker-compose up
```

Next generate a new account with:
```
$ make new-account
```

Then send yourself some ETH with the faucet_util.py:
```
$ docker cp utils/faucet_util.py bootstrap:/ethereum/
$ docker exec -it bootstrap bash
$ # Logs into docker container
$$ python faucet_util.py $FAUCET_PRIV_KEY $YOUR_ADDRESS localhost
$$ # Check that the transaction worked with
$$ python
> from web3 import Web3, HTTPProvider
> provider_uri = 'http://0.0.0.0:8545'
> web3 = Web3(HTTPProvider(provider_uri))
> web3.eth.getBalance($YOUR_ADDRESS)
50000000000000000000  # Yay!
```

Login to the network with your validator by running:
```
$ make run-node validate=true deposit=5000 network_name=dockerpyethdev_back bootstrap_node=enode://d3260a710a752b926bb3328ebe29bfb568e4fb3b4c7ff59450738661113fb21f5efbdf42904c706a9f152275890840345a5bc990745919eeb2dfc2c481d778ee@172.18.250.2:30303
```

You can then stop your validator and logout with:
```
$ make run-node validate=true logout=true network_name=dockerpyethdev_back bootstrap_node=enode://d3260a710a752b926bb3328ebe29bfb568e4fb3b4c7ff59450738661113fb21f5efbdf42904c706a9f152275890840345a5bc990745919eeb2dfc2c481d778ee@172.18.250.2:30303
```
