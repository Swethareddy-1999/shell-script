#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
y="\e[31m"
N="\e[0m"

#imagine user have source and destination dir access

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is not providing number of days, we are taking 14 days as default

LOGS_FOLDER="/home/ec2-user/shellscript-logs/"

LOG_FILE=$(echo $0 | cut -d "." -f1)
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

USAGE(){
    echo -e "$R USAGE:: $N sh 12.backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optiional)>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs/

#usage 1

if [ $# -lt 2 ] # $#: no.of parameters lessthen 2 files
then
    USAGE
fi

#usage2

if [ ! -d $SOURCE_DIR ] # ! means false; and if $source_dir not there it will also false(f*f=s)
then
    echo -e "$SOURCE_DIR Does not exist plese check"
    exit 1
fi  

if [ ! -d $DEST_DIR ]
then
    echo -e "$DEST_DIR Does not exist plese check"
    exit 1
fi 

echo "Script started excuting at: $TIMESTAMP" &>>$LOG_FILE_NAME


FILES=(find $SOURCE_DIR -name "*.log" -mtime $DAYS)

echo "Files are: $FILES"