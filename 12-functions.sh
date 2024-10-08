#!/bin/bash

USERID=$(id -u)
#echo "user ID is: $USERID"

VALIDATE_sudhir(){
    #echo "exit status : $1"
    if [ $1 -ne 0 ]
    then 
        echo "$2 is failed"
        exit 1
    else
        echo "$2 is success"
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
    VALIDATE_sudhir $? "Installing git"   #VALIDATE_sudhir is a function call


else 
    echo " git already installed, nothing to do..."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed"
    dnf install mysql -y
    VALIDATE_sudhir $? "Installing MySQL"
else
    echo "MySQL is already installed"
fi