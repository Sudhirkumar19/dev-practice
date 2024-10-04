#!/bin/bash

Fruits=("Apple", "banana") #Array
echo "first fruit is : ${Fruits[0]}"
echo "second fruit is : ${Fruits[1]}"

echo "first fruit is : ${Fruits[@]}" #@ means all fruits at a time