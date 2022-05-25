export NEAR_ACCT=anank2.testnet
export DAO=genesisdao.$NEAR_ACCT
export MAX_GAS=300000000000000 
export BOND_AMOUNT=1

#30 Caractères sur la 1ère ligne

near call $DAO add_proposal '{
    "proposal" : {
        "description" : "Change the DAO config"
        "kind" : {
            "ChangeConfig" :{
                "config": 
                
            }
        }
    }
}'


near call $DAO add_proposal '{
    "proposal" : {
        "description" : "Upgrade policy to simplify test vote"
        "kind" : {
            "ChangePolicy" :{
                "policy": 
            }
        }
    }
}'






near call $DAO add_proposal '{
    "proposal" : {
        "description" : "First bounty test"
        "kind" : {
            "AddBounty" :{
                
            }
        }
    }
}'

near call $DAO add_proposal '{
    "proposal" : {
        "description" : "Create a new role"
        "kind" : {
            "ChangePolicy" :{


            }
        }
    }
}'


near call $DAO add_proposal '{
    "proposal" : {
        "description" : "Set a stacking contract in this DAO"
        "kind" : {
            "SetStackingContract" :{
                
            }
        }
    }
}'






near call $DAO add_proposal '{
    "proposal" : {
        "description" : "Upgrade policy to simplify test vote"
        "kind" : {
            "ChangePolicy" :{
                
            }
        }
    }
}'

# Allows this contract to execute any arbitrary set of actions in other contracts.
#    FunctionCall {
#        receiver_id: AccountId,
#        actions: Vec<ActionCall>,
#    },

near call $DAO add_proposal '{"proposal" :{
    "description": "Execute a Function Call from this proposal",
    "kind":{
        "FunctionCall":{
            "receiver_id":"",
            "actions": ""
            }
        }
    }
}'
--accountId $NEAR_ACCT --amount $BOND_AMOUNT --gas $MAX_GAS


# --- Working on ---

near call $DAO add_proposal ' {
    "proposal": {
        "description": "Add the new role member Stagiaire",
        "kind": {
            "ChangePolicyAddOrUpdateRole": {
                "role": {    
                    "name": "stagiaire",
                    "kind": {
                        "Group": ["anank3.testnet"]
                    },
                    "permissions": ["*:AddProposal", "*:VoteApprove", "*:VoteReject"],
                    "vote_policy": {}
                }
            }
        }
    }
} ' --accountId $NEAR_ACCT --amount $BOND_AMOUNT 

#Problem with permissions format

near call $DAO add_proposal '{ "proposal": { "description": "Transfer NEAR from DAO to an account","kind": {"Transfer": { "token_id" : "genesisdao.anank2.testnet", "receiver_id" : "anank3.testnet", "amount" : "3", "msg": ""}}}}' --accountId anank2.testnet --amount $BOND_AMOUNT

#Problem  Failure [genesisdao.anank2.testnet]: Error: {"index":0,"kind":{"ExecutionError":"Exceeded the prepaid gas."}}
#         Transaction 4jRFXJVFVybET2djwxUzqDyfPs4wVr5sVLvXDd7TK3C3 had 30000000000000 of attached gas but used 2428017145162 of gas 


# --- Approve prop to update vote policy ---
near call $DAO act_proposal '{"id":4, "action": "VoteApprove"}' --accountId $NEAR_ACCT
near call $DAO act_proposal '{"id":9, "action": "VoteApprove"}' --accountId anank1.testnet
near call $DAO act_proposal '{"id":9, "action": "VoteApprove"}' --accountId marseille.testnet


# --- Proposals which working ---

near call $DAO add_proposal '{ 
    "proposal": {
        "description": "Update voting policy to simplify test vote",
        "kind":{
            "ChangePolicyUpdateDefaultVotePolicy": {
                "vote_policy":{
                    "weight_kind": "RoleWeight",
                    "quorum": "0",
                    "threshold": [1,4]
                }
            }
        }
    }
}' --accountId $NEAR_ACCT --gas $MAX_GAS

near call $DAO add_proposal '{
    "proposal" : {
        "description": "New member wants to join us in stagiaire role",
        "kind" : {
            "AddMemberToRole" :{
                "member_id": "nametest.testnet",
                "role" : "council"
            }
        }
    }
}' --accountId $NEAR_ACCT --amount $BOND_AMOUNT --gas $MAX_GAS

near call $DAO add_proposal '{
    "proposal" : {
        "description" : "Upgrade DAO version"
        "kind" : {
            "UpgradeSelf" :{
                "hash" : 
            }
        }
    }
}' --accountId $NEAR_ACCT --amount $BOND_AMOUNT --gas $MAX_GAS

near call $DAO add_proposal '{
    "proposal" : {
        "description" : "Remove a member"
        "kind" : {
            "RemoveMemberFromRole" :{
                "member_id": ""
                "role" : "council"
            }
        }
    }
}' --accountId $NEAR_ACCT --amount $BOND_AMOUNT --gas $MAX_GAS

# --- Available View functions ---
# https://github.com/near-daos/sputnik-dao-contract/issues/128
