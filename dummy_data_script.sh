#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <number>"
  exit 1
fi

num=$1

if ! [[ $num =~ ^[0-9]+$ ]]; then
  echo "Error: Argument must be a number."
  exit 1
fi

result=""

# 商
quotient=$((num / 10))
# 余り
remainder=$((num % 10))

INIT_COUNTER=0
counter=$INIT_COUNTER
if((quotient == 0)); then
    for ((i = 1; i < remainder+1 ; i++)); do
        result=$i$result
    done
else
    PADDING=000000000
    for ((i = 0; i < quotient; i++)); do
        result=$PADDING$counter$result
        if (( counter == 9 )); then
            counter=$INIT_COUNTER
        else
            counter=$((counter + 1))
        fi
    done
    if (( remainder != 0 )); then
        result=$counter$result
        for ((i = 1; i < remainder ; i++)); do
            result=0$result
        done
    fi
fi
echo $result
