current_dir = $(shell pwd)
keystore_path := ./validator/data/config/keystore
pwd_path := ./validator/data/config/password.txt

new-account:
	bash ./utils/new-account.sh $(keystore_path) $(pwd_path) $(current_dir)

# Defaults
bootstrap_node?=enode://d3260a710a752b926bb3328ebe29bfb568e4fb3b4c7ff59450738661113fb21f5efbdf42904c706a9f152275890840345a5bc990745919eeb2dfc2c481d778ee@54.167.247.63:30303
bootstrap_uri?=http://54.167.247.63:8545
log_config?=eth.chain:info,eth.chainservice:info,eth.validator:info
account?=1
mine_percent?=0
validator_name?=validator
# Deposit and logout commands if given
ifneq ($(strip $(deposit)),)
_deposit=--deposit ${deposit}
endif
ifeq ($(validate),true)
_validate=--validate ${account}
endif
ifeq ($(logout),true)
_logout=--logout
endif
# Join network if given
ifneq ($(strip $(network_name)),)
network=--network ${network_name}
endif

run-node:
	docker build ./validator -t casper-validator
	@echo "\n🌟👻 Starting node! 👻🌟\n"
	docker run -it --name ${validator_name} \
		-v $(current_dir)/validator/data/config:/root/.config/pyethapp \
		-v $(current_dir)/validator/data/log:/root/log \
		${network} \
		casper-validator \
		pyethapp -m ${mine_percent} --unlock ${account} ${_validate} ${_deposit} ${_logout} --password /root/.config/pyethapp/password.txt -l ${log_config} --log-file /root/log/log.txt -b ${bootstrap_node} run
	docker logs -f ${validator_name}


data_path := 99
new-account2:
	bash ./utils/new-account2.sh ./validator/data$(data_path) $(current_dir)

run-node2:
	docker build ./validator -t casper-validator
	@echo "\n🌟👻 Starting node! 👻🌟\n"
	docker run -it --name validator$(data_path) \
                -v $(current_dir)/validator/data$(data_path)/config:/root/.config/pyethapp \
                -v $(current_dir)/validator/data$(data_path)/log:/root/log \
                ${network} \
                casper-validator \
                pyethapp -m ${mine_percent} --unlock ${account} ${_validate} ${_deposit} ${_logout} --password /root/.config/pyethapp/password.txt -l ${log_config} --log-file /root/log/log.txt -b ${bootstrap_node} run
	docker logs -f ${validator_name}
