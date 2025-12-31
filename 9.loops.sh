#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
y="\e[31m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$( echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ] #$?privious output will come here as input
    then    
        echo "$2 ...$R failure"
        exit 1
    else
        echo "$2 ... $G success"
    fi
}

echo "Script started excuting at: $TIMESTAMP" &>>$LOG_FILE_NAME

for package in $@
do 
    dnf list installed $package &>>$LOG_FILE_NAMES
    if [$? -ne 0]
    then
        dnf install $package -y &>>$LOG_FILE_NAMES
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is alredy $Y .. installed"    
        fi
    done    