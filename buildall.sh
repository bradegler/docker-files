#!/bin/sh

docker build -t="bradegler/base" ./base
for dir in `ls -d */ | grep -v base | cut -d'/' -f1`;
do
    echo "bradegler/$dir"
    docker build -t="bradegler/$dir" ./$dir
done;
