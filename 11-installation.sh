#!/bin/bash

USERID=$(id -u)
echo "user ID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo " please run script with roogt permissions"
fi

dnf install git -y

