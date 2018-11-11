/**
 */
#pragma once

#include <eosiolib/eosio.hpp>
#include <eosiolib/crypto.h>

using namespace eosio;
using namespace std;

CONTRACT Randomizer : public contract 
{
    public:
        using contract::contract;

        ACTION get(name sig);

        ACTION bet(capi_checksum256 hash, capi_checksum256 secret);

        TABLE randnum {
            uint64_t id; 
            uint64_t   num; 
            
            uint64_t primary_key() const { return id; }
        };
        // @table: Maps users to a list (can be used for Whitelists or Blacklists)
        // @scope: user account name
        typedef eosio::multi_index<"randnums"_n, randnum> randum_index;

    private:

};
