#! bin/bash

#Come to build.sh location
cd sputnik-dao-contract/sputnikdao-factory2 && .build.sh;
#Put the owner account of DAO factory contract
export NEAR_ACCT=anank8.testnet; 
#Deploy SC sputnik dao factory from wasm file
near deploy $NEAR_ACCT --wasmFile=res/sputnikdao_factory2.wasm --accountId $NEAR_ACCT;
#Call function new() inside sputnikdao factory contract
near call $NEAR_ACCT new --accountId $NEAR_ACCT --gas 100000000000000;
#Factory's council
export council_member1=$NEAR_ACCT;
export council_member2=anank7.testnet;
export council_member3=anank8.testnet;
export COUNCIL=["'$council_member1'", "'$council_member2'", "'$council_member3'"];
#Factory's arguments
# weight_kind : policy.rs, l.114
#   Minimum number required for vote to finalize.
#   If weight kind is TokenWeight - this is minimum number of tokens required.
#   This allows to avoid situation where the number of staked tokens from total supply is too small.
#   If RoleWeight - this is minimum number of votes.
#   This allows to avoid situation where the role is got too small but policy kept at 1/2, for example.
#    pub quorum: U128,
#TokenWeight
export ARGS=`echo '{"config": {
    "name": "namedao",
    "purpose": "Ici une description",
    "metadata":""},
"policy": '$COUNCIL'}' | base64`
near call $NEAR_ACCT create '{\"name\": \"namedao\", \"args\": \"$ARGS\"}' --accountId $NEAR_ACCT --gas 150000000000000


export role_stagiaires='{"name": "stagiaires", "kind": {
    "group": [""]
    },
    "permissions": ["*:AddProposal", "*:VoteApprove", "*:VoteReject"],
    "vote_policy": {
        "weight_kind": "RoleWeight",
        "quorum": "1",
        "threshold": [1,3]
        }
    }'


export role_investisseurs='{"name": "investisseurs", "kind": {
    "member": 1
    },
    "permissions": ["*:AddProposal, "*:VoteApprove"],
    "vote_policy": {
        "weight_kind": "TokenWeight",
        "quorum": 0,
        "threshold": 1
    }
}'

export ALL='{
      name: "all",
      kind: "Everyone",
      permissions: [ "*:AddProposal" ],
      vote_policy: "{}"
    }'

export COUNCIL_POLICY='{
      name: "council",
      kind: {
        Group: [ "anank8.testnet", "anank6.testnet", "anank7.testnet" ]
      },
      permissions: [
        "*:Finalize",
        "*:AddProposal",
        "*:VoteApprove",
        "*:VoteReject",
        "*:VoteRemove"
      ],
      vote_policy: "{}"
    }'

export DEFAULT_VOTE_POLICY='{
        "weight_kind": "RoleWeight",
        "quorum": "2",
        "threshold": [1,3]
}'
export PROPOSAL_BOND=10000000000000
export PROPOSAL_PERIOD=30240000000000
export BOUNTY_BOND=100000000000000
export BOUNTY_FORGIVENESS_PERIOD=432000000000
export POLICY='{
    "roles": "["'$ALL'", "'$COUNCIL_POLICY'", '$role_stagiaires'", "'$role_investisseurs'"]",
    "default_vote_policy": "'$DEFAULT_VOTE_POLICY'",
    "proposal_bond": $PROPOSAL_BOND,
    "proposal_period": $PROPOSAL_PERIOD,
    "bounty_bond": $BOUNTY_BOND,
    "bounty_forgiveness_period": $BOUNTY_FORGIVENESS_PERIOD

}'
export NAME=daocomplet1
export ARGS=`echo '{"config": {
    "name": "'$NAME'",
    "purpose": "This DAO contains initially stagiaires and investisseurs roles.",
    "metadata": ""
}, "policy": "'$COUNCIL'"}' | base64`

near call $DAO  

# pub struct DaoContractMetadata {
#     // version of the DAO contract code (e.g. [2, 0] -> 2.0, [3, 1] -> 3.1, [4, 0] -> 4.0)
#     pub version: Version,
#     // commit id of https://github.com/near-daos/sputnik-dao-contract
#     // representing a snapshot of the code that generated the wasm
#     pub commit_id: String,
#     // if available, url to the changelog to see the changes introduced in this version
#     pub changelog_url: Option<String>,
# }
