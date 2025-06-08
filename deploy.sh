#!/bin/bash

if [[ $# -eq 0 || "$1" != "-t" || -z "$2" ]]; then
    echo "Invalid arguments. Usage: $0 -t <tag>"
    exit 1
fi

TAG="$2"

if [[ "$(docker images -q new_image:$TAG 2> /dev/null)" == "" ]]; then
    echo "Image with tag $TAG does not exist. Please build the image first."
    exit 1
fi

docker run -d --name new_container new_image:$TAG