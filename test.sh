#!/bin/bash

output=$(./app.sh)

if [ "$output" = "application is running" ] 
then
    echo "TEST Failed"
    exit 1
else
    echo "TEST FAILED"
    
fi
