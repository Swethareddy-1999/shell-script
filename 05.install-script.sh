#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] #ne=not eqaul
then 
    echo "ERROR:: you must have sudo access to excute this script"
    #exit 1 #other then 0
fi

yum install mysql -y

yum install git -y
yum install docker -y
