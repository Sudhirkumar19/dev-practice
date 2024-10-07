#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[33m"
#echo "user ID is: $USERID"

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

if [ $USERID -ne 0 ]
then
    echo " please run script with roogt permissions"

    exit 1
fi

dnf list installed git

#VALIDATE $? "listing git"

if [ $? -ne 0 ]
then
    echo " git is not installed, going to install it..."
    dnf install git -y
    VALIDATE $? "Installing git"


else 
    echo " git already installed, nothing to do..."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already installed"
fi