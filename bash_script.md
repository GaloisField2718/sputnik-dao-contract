near login;
cd sputnikdao-factory2;
./build.sh;
export CONTRACT_ID=anank2.testnet;
near deploy $CONTRACT_ID --wasmFile=res/sputnikdao_factory2.wasm --accountId $CONTRACT_ID;
near call $CONTRACT_ID new --accountId $CONTRACT_ID --gas 100000000000000;
export COUNCIL='["anank2.testnet","marseille.testnet"]';
export ARGS=`echo '{"config": {"name": "genesisdao", "purpose": "It is the genesis dao", "metadata": ""}, "policy": '$COUNCIL'}' | base64`; 
near call $CONTRACT_ID create "{\"name\": \"genesisdao\", \"args\": \"$ARGS\"}" --accountId $CONTRACT_ID --amount 10 --gas 150000000000000;


SOLUTION : export ARGS=`echo '{"config": {"name": "genesisdao", "purpose": "it is the genesis dao", "metadata": ""}, "policy": ["marseille.testnet", "marseille1.testnet","anank1.testnet","anank2.testnet"]}' | base64`

OUT

Please authorize NEAR CLI on at least one of your accounts.

If your browser doesn't automatically open, please visit this URL
https://wallet.testnet.near.org/login/?referrer=NEAR+CLI&public_key=ed25519%3A43o4MeGMi56QzevKi4A8LDSGEuPWofNSLbHfu7uhxSpj&success_url=http%3A%2F%2F127.0.0.1%3A5001
Please authorize at least one account at the URL above.

Which account did you authorize for use with NEAR CLI?
Enter it here (if not redirected automatically):
Logged in as [ anank2.testnet ] with public key [ ed25519:43o4Me... ] successfully

    Finished release [optimized + debuginfo] target(s) in 0.88s
Starting deployment. Account id: anank2.testnet, node: https://rpc.testnet.near.org, helper: https://helper.testnet.near.org, file: res/sputnikdao_factory2.wasm
Transaction Id G7DnQcsyogGsjdvnX2aEuU4gnP2VX82sJ2ZLxMqs9reW
To see the transaction in the transaction explorer, please open this url in your browser
https://explorer.testnet.near.org/transactions/G7DnQcsyogGsjdvnX2aEuU4gnP2VX82sJ2ZLxMqs9reW
Done deploying to anank2.testnet
Scheduling a call: anank2.testnet.new()
Doing account.functionCall()
Transaction Id FfbQCDREtWH6tZSA32SG1VZNo9yFQjbGeGojinxVSoZs
To see the transaction in the transaction explorer, please open this url in your browser
https://explorer.testnet.near.org/transactions/FfbQCDREtWH6tZSA32SG1VZNo9yFQjbGeGojinxVSoZs
''
Scheduling a call: anank2.testnet.create({"name": "genesis", "args": "eyJjb25maWciOiB7Im5hbWUiOiAiZ2VuZXNpc0RBTyIsICJwdXJwb3NlIjogIkl0IGlzIFRIRSBHZW5lc2lzIERBTyIsICJtZXRhZGF0YSI6ICJNZXRhZGF0YXMifSwgInBvbGljeSI6IFsibWFyc2VpbGxlLnRlc3RuZXQiLCAibWFyc2VpbGxlMS50ZXN0bmV0IiwiYW5hbmsxLnRlc3RuZXQiXX0K"}) with attached 10 NEAR
Doing account.functionCall()
Retrying request to broadcast_tx_commit as it has timed out [
  'DgAAAGFuYW5rMi50ZXN0bmV0AC1KTNj9yZzQ5LRqdvAtwH3ThpVn0l4+tID0928y7f5sgxETawhRAAAOAAAAYW5hbmsyLnRlc3RuZXTjXCoAzEN7I5y9mKNpGbObpFT1+gez3u+KDY36KGtFhwEAAAACBgAAAGNyZWF0ZfwAAAB7Im5hbWUiOiJnZW5lc2lzIiwiYXJncyI6ImV5SmpiMjVtYVdjaU9pQjdJbTVoYldVaU9pQWlaMlZ1WlhOcGMwUkJUeUlzSUNKd2RYSndiM05sSWpvZ0lrbDBJR2x6SUZSSVJTQkhaVzVsYzJseklFUkJUeUlzSUNKdFpYUmhaR0YwWVNJNklDSk5aWFJoWkdGMFlYTWlmU3dnSW5CdmJHbGplU0k2SUZzaWJXRnljMlZwYkd4bExuUmxjM1J1WlhRaUxDQWliV0Z5YzJWcGJHeGxNUzUwWlhOMGJtVjBJaXdpWVc1aGJtc3hMblJsYzNSdVpYUWlYWDBLIn0AYLeYbIgAAAAAAEpIARQWlUUIAAAAAAAApJGD17VJSTorOBXoYOOX2Xt/FAqWXKGCogPcZTug3wHppbPlsr6PEuu1cLLEWV/ygMD0v/iMlQt9/DhENmLzCg=='
]
Receipts: BUBWQ4HymKQZv1BpMz1PDZaihw6p6rP1vYYmNUpmUxD4, 4uSNXBfFGcr1mqf994RSxwCYkQdTLvnyXiMAAxVjQ37N
        Failure [anank2.testnet]: Error: {"index":3,"kind":{"ExecutionError":"Smart contract panicked: panicked at 'Failed to deserialize input from JSON.: Error(\"Encoded text cannot have a 6-bit remainder.\", line: 1, column: 94)', sputnikdao2/src/lib.rs:83:1"}}
ServerTransactionError: {"index":3,"kind":{"ExecutionError":"Smart contract panicked: panicked at 'Failed to deserialize input from JSON.: Error(\"Encoded text cannot have a 6-bit remainder.\", line: 1, column: 94)', sputnikdao2/src/lib.rs:83:1"}}
    at Object.parseResultError (/usr/local/lib/node_modules/near-cli/node_modules/near-api-js/lib/utils/rpc_errors.js:31:29)
    at Account.signAndSendTransactionV2 (/usr/local/lib/node_modules/near-cli/node_modules/near-api-js/lib/account.js:160:36)
    at processTicksAndRejections (node:internal/process/task_queues:96:5)
    at async scheduleFunctionCall (/usr/local/lib/node_modules/near-cli/commands/call.js:57:38)
    at async Object.handler (/usr/local/lib/node_modules/near-cli/utils/exit-on-error.js:52:9) {
  type: 'FunctionCallError',
  context: undefined,
  index: 3,
  kind: {
    ExecutionError: `Smart contract panicked: panicked at 'Failed to deserialize input from JSON.: Error("Encoded text cannot have a 6-bit remainder.", line: 1, column: 94)', sputnikdao2/src/lib.rs:83:1`
  },
  transaction_outcome: {
    block_hash: 'DPpuLtqxKfESAF7YS7WBPjptcPLjm8DFYqVC9xXNm1yU',
    id: '5rqqhRHZjvTrKfRBWBgHWGMeubCKpv2CqT55jTV8r77i',
    outcome: {
      executor_id: 'anank2.testnet',
      gas_burnt: 2428497870972,
      logs: [],
      metadata: [Object],
      receipt_ids: [Array],
      status: [Object],
      tokens_burnt: '242849787097200000000'
    },
    proof: [ [Object], [Object] ]
  }
}


Modifs : //export ARGS=`echo '{"config": {"name": "genesis", "purpose": "It is THE Genesis DAO", "metadata": "Metadatas"}, "policy": '$COUNCIL'}'`;


./build.sh;
export CONTRACT_ID=anank2.testnet;
near deploy $CONTRACT_ID --wasmFile=res/sputnikdao_factory2.wasm --accountId $CONTRACT_ID;
export COUNCIL='["marseille.testnet", "marseille1.testnet","anank1.testnet","anank2.testnet"]';
export ARGS=`echo '{"config": {"name": "genesis", "purpose": "It is THE Genesis DAO", "metadata": ""}, "policy": '$COUNCIL'}'`;
near call $CONTRACT_ID create "{\"name\": \"genesis\", \"args\": \"$ARGS\"}" --accountId anank2.testnet --amount 10 --gas 150000000000000;

------------------------------------------------------------------------------------------------------
Modifs From /Users/thomassuau/Desktop/SC_NEAR/sputnik-dao-contract/scripts/upgrade_dao_proposal_dev.sh
------------------------------------------------------------------------------------------------------
export GAS_100_TGAS=100000000000000
V3_BYTES=`cat 'sputnikdao2/res/sputnikdao2.wasm' | base64`
near call $SPUTNIK_ID store $(eval "$V3_BYTES") --base64 --accountId anank1.testnet --gas $GAS_100_TGAS --amount 10 > v3_code_hash_result.txt

# propose UpgradeSelf using the code_hash from store_blob
near call $SPUTNIK_ID add_proposal '{ "proposal": {"description": "Upgrade to v3 DAO code using local stored code","kind": {"UpgradeSelf": {"hash": "'$V3_CODE_HASH'"}}}}' --accountId anank2.test --amount 10 --gas $MAX_GAS




