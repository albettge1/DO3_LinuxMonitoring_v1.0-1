#!/bin/bash

SCRIPT=info.sh
if [ ! -f "$SCRIPT" ]; then
        echo "No such file"
        exit
fi
if [ $# != 1 ]; then
        echo "No such file or directory $#"
elif [ ${1: -1} != "/" ]; then
        echo "There should be a symbol: / "
else
        ./info.sh $1
fi