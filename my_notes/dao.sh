COMMIT_V3=596f27a649c5df3310e945a37a41a957492c0322
export NEAR_ACCT=anank2.testnet
export FACTORY_ACCOUNT_ID=factorydao.anank2.testnet
export FACTORY=testnet
export MAX_GAS=300000000000000
export GAS_100_TGAS=100000000000000
export GAS_150_TGAS=150000000000000

near create-account $FACTORY_ACCOUNT_ID --masterAccount $NEAR_ACCT --initialBalance 40

export COUNCIL='["'$NEAR_ACCT'"]'
DAO_NAME=subdao1
DAO_ARGS=`echo '{"config": {"name": "'$DAO_NAME'", "purpose": "We create a dao on factory genesisdao", "metadata":""}, "policy": '$COUNCIL', "proposal_period": '604800000000'}' | base64`
near call $FACTORY_ACCOUNT_ID create "{\"name\": \"$DAO_NAME\", \"args\": \"$DAO_ARGS\"}" --accountId $FACTORY_ACCOUNT_ID --gas $GAS_150_TGAS --amount 10
DEMO_DAO_ACCOUNT=$DAO_NAME.$FACTORY_ACCOUNT_ID
