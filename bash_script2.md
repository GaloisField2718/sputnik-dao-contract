bash_script2.md

near dev-deploy --wasmFile=res/sputnikdao_factory2.wasm;
CONTRACT_ID="dev-1651738762809-54457981109302";
echo $CONTRACT_ID;
near call $CONTRACT_ID new '{}' --accountId $CONTRACT_ID --gas 100000000000000;
ARGS=`echo '{"purpose": "Dev Genesis DAO", "council"="anank1.testnet", "marseille.testnet"], "bond": "1000000000000000000000000", "vote_period": "18000", "grace_period": "1800000000"}' | base64`;
near call $CONTRACT_ID create "{\"name\": \"Genesis_dev_DAO\", \"public_key\": null, \"args\": \"$ARGS\"}"  --accountId $CONTRACT_ID --amount 30 --gas 100000000000000;


dev-1651738762809-54457981109302
dev-1651738762809-54457981109302
//Récupérer l'ID du compte dev-xxxx créé 