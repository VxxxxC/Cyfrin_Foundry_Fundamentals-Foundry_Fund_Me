-include .env

build:; forge build

test-contracts:; forge test -f localhost:8545 -vvv
coverage:; forge coverage -f localhost:8545

deploy-sepolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe -f ${SEPOLIA_RPC_URL} --private-key ${SEPOLIA_PRIVATE_KEY} --broadcast --verify --etherscan-api-key ${ETHERSCAN_API_KEY} -vvv
