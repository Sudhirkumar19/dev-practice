#!/bin/bash

USERID=$(id -u)
#echo "user ID is: $USERID"

VALIDATE(){
    #echo "exit status : $1"
    if [ $1 -ne 0]
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

VALIDATE $? "listing git"

# if [ $? -ne 0 ]
# then
#     echo " git is not installed, going to install it..."
#     dnf install git -y
#     if [ $? -ne 0]
#     then
#         echo "git installation is not done"
#         exit 1
#     else
#         echo "git installation is done"
#     fi


# else 
#     echo " git already installed, nothing to do..."
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "MYSQL is not installed"
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then 
#         echo " MYSQL installation is failure"
#         exit 1

#     else 
#         echo "MYSQL installtion is success"
#     fi
# else
#     echo "MUSQL is already installed"
# fi