#! bin/bash

#Come to build.sh location
cd sputnik-dao-contract/sputnikdao-factory2 && .build.sh;
#Put the owner account of DAO factory contract
export NEAR_ACCT=anank4.testnet; 
#Deploy SC sputnik dao factory from wasm file
near deploy $NEAR_ACCT --wasmFile=res/sputnikdao_factory2.wasm --accountId $NEAR_ACCT;
#Call function new inside sputnikdao factory contract
near call $CONTRACT_ID new --accountId $CONTRACT_ID --gas 100000000000000;
#Factory's council
export council_member1= ;
export council_member2= ;
export council_member3= ;
export COUNCIL='["council_member1", "council_member2", "council_member3"]';
#Factory's arguments
# weight_kind : policy.rs, l.114
#   Minimum number required for vote to finalize.
#   If weight kind is TokenWeight - this is minimum number of tokens required.
#   This allows to avoid situation where the number of staked tokens from total supply is too small.
#   If RoleWeight - this is minimum number of votes.
#   This allows to avoid situation where the role is got too small but policy kept at 1/2, for example.
#    pub quorum: U128,
#TokenWeight

export role_stagiaires='{"name": "stagiaires", "kind": {
    "Group": [""]
    },
    "permissions": ["*:AddProposal", "*:VoteApprove", "*:VoteReject"],
    "vote_policy": {
        "weight_kind": "RoleWeight",
        "quorum": "1",
        "threshold": [1,3]
        }
    }'

export role_investisseurs='{"name": "investisseurs", "kind": {
    
}}'