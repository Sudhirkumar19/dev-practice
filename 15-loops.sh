#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[33m"
#echo "user ID is: $USERID"
CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
    echo " please run script with roogt permissions"

    exit 1
fi
}


VALIDATE(){
    #echo "exit status : $1"
    if [ $1 -ne 0]
    then 
        echo -e "$2 is $R failed $N"
        exit 1
    else
        echo -e "$2 is $G success $N"
    fi
}
CHECK_ROOT

# sh 15-llops.sh git mysql  postfix nginx
for package in $@ # $@ refers to all arguments passed to it'
do
    dnf list installed $package #JUST CHECKING whether installed or not

#VALIDATE $? "listing git"

    if [ $? -ne 0 ]
    then
        echo " $package is not installed, going to install it..."
        dnf install $package -y
        VALIDATE $? "Installing $package"


    else 
        echo " $package already installed, nothing to do..."
    fi
done
