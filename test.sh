#!/bin/bash

output=$(./app.sh)

if [ "$output" = "something else" ] 
then
    echo "TEST PASSED"
else
    echo "TEST FAILED"
    exit 1
fi
