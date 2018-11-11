#include "Randomizer.hpp"
            
void Randomizer::get(name sig) {
    print( "Hello, ", sig );
}

void Randomizer::bet(capi_checksum256 hash, capi_checksum256 secret) {

}

EOSIO_DISPATCH(Randomizer,(get)(bet))
