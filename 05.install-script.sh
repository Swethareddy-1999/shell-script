#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] #ne=not eqaul
then 
    echo "ERROR:: you must have sudo access to excute this script"
    exit 1 #other then 0
fi

yum list installed mysql

if [ $? -ne 0 ]
then  #not installed
    if [ $? -eq 0 ] #$?privious output will come here as input
    then    
        echo "Installing Mysql ...failure"
        exit 1
    else
        echo "installing mysql ... success"
    fi
else
    echo "mysql is already ...installed"
fi



yum install git -y

if [ $? -eq 0 ]
then    
    echo "Installing git...failure"
    exit 1
else
    echo "installing git ... success"
fi        

