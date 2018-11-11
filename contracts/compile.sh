#! /bin/bash
### Usage: compile [eosio file to compile, omit .cpp] 
### Constants
FILE_TO_COMPILE="$1"
FILE_NAME_CPP="$FILE_TO_COMPILE.cpp"
FILE_NAME_WASM="$FILE_TO_COMPILE.wasm"
### Functions
if [ "$FILE_TO_COMPILE" != "" ]; then
    eosio-cpp -o $FILE_NAME_WASM $FILE_NAME_CPP --abigen
else
    echo "Usage: compile [eosio.cpp file to compile]"
fi
