#!/bin/bash

echo "all varisbles passed to the script : $@"

echo "Number of variables passed : $#"

echo "scipt name: $0"

echo "Home directory of current user: $HOME"

echo "PID of the script executing now: $$"

sleep 100 & 

echo "PID of last background command :$!"