#!/bin/bash

output=$(./app.sh)

if [ "$output" = "application is running" ] 
then
    echo "TEST PASSED"
else
    echo "TEST FAILED"
    exit 1
fi
