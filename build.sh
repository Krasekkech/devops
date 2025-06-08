#!/bin/bash


if [ $# -ne 2 ]
then
    echo "Invalid arguments. Usage: $0 -t <tag>"
    exit 1
fi


TAG="$2"


docker build -t new_image:$TAG .