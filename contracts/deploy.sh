
# Set up wallet
if [[ -z "${PASSWORD}" ]]; then
  echo "ERROR: run 'export PASSWORD=[password] to set your wallet password'"
  exit 1
else
  PASSWORD="${PASSWORD}"
fi

# Account Private keys
EOSIO_ACCT="5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"
OWNER_ACCT="5JZFa9amw1scxXtye9BitvMDp2cZywVKHRrY43nDUHezZXdeSUS"
ACTIVE_ACCT="5JKAjH9WH4XnZCEe8v5Wir7awV4YBTVa8KUSqWJbQR6QGtj4yce"

# Account public keys
OWNER_KEY="EOS7AqjRLtBVRfd64rSU2t6zPkwphy77bSYoFLLLwVfrrSBMPqrvy"
ACTIVE_KEY="EOS8UAsFY4RacdaeuadicrkP66JQxPsbNyucmbT8Z4GjwFoytsK9u"

# Contract accounts
LOTTERY="eoslotteryc4"

echo "===UNLOCKING WALLET==="
cleos wallet unlock -n default --password $PASSWORD

# Create contract accounts
echo "===CREATING CONTRACT ACCOUNTS==="
cleos create account eosio $LOTTERY $OWNER_KEY $ACTIVE_KEY

echo "===CREATING USER ACCOUNTS==="
cleos create account eosio nick $OWNER_KEY $ACTIVE_KEY
cleos create account eosio joy $OWNER_KEY $ACTIVE_KEY

# Deploy contracts

FILE_TO_DEPLOY="$1"
FILE_NAME_ABI="$FILE_TO_DEPLOY.abi"
FILE_NAME_WASM="$FILE_TO_DEPLOY.wasm"

### Functions
if [ "$FILE_TO_DEPLOY" != "" ]; then
    cleos set contract $LOTTERY . $FILE_NAME_WASM $FILE_NAME_ABI
else
    echo "Usage: deploy [Contract]"
fi