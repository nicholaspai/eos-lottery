# eos-lottery

1. compile: `cd ./contracts/ && ./compile.sh [target]` outputs wasm and abi files in `./contracts`

2. deploy: 

# Randomization
[dice.cpp (included in eosio) with OpenSSL for external random seed generation](https://developers.eos.io/eosio-cpp/docs/random-number-generation)

Randomization comes from users submitting their own secrets

Alternatively, I think I'm going to use an express server to get random numbers. There is *no* way to generate non-deterministic random numbers on-chain. By definition, on-chain consensus must have deterministic outputs