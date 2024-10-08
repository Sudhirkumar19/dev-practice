#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"

SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[33m"
#echo "user ID is: $USERID"  # CHECKROOT is a function call here
CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
    echo  -e "$R please run script with roogt permissions $N" &>>$LOG_FILE

    exit 1
fi
}

# VALIDATE is a function call here
VALIDATE(){
    #echo "exit status : $1"
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R failed $N" &>>$LOG_FILE
        exit 1
    else
        echo -e "$2 is $G success $N" &>>$LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: sudo sh 16-redirectors.sh package1 package2 ... $N "
    exit 1
}
echo -e "$G script started executing at: $N $(date)"&>>$LOG_FILE
CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

# sh 15-llops.sh git mysql  postfix nginx
for package in $@ # $@ refers to all arguments passed to it'
do
    dnf list installed $package &>>$LOG_FILE  #JUST CHECKING whether installed or not

#VALIDATE $? "listing git"

    if [ $? -ne 0 ]
    then
        echo " $package is not installed, going to install it..." &>>$LOG_FILE
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $? "Installing $package"


    else 
        echo " $package already installed, nothing to do..." &>>$LOG_FILE
    fi
done
