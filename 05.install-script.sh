#!bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ] #ne=not eqaul
then 
    echo "ERROR:: you must have sudo access to excute this script"
    exit 1 #other then 0
fi

yum install mysql -y

if [ $? -eq 0 ] #$?privious output will give here as input
then    
    echo "Installing MYAQL ...failure"
    exit 1
else
    echo "installing mysql ... success"
fi
yum install git -y

if [ $? -eq 0 ]
then    
    echo "Installing git...failure"
    exit 1
else
    echo "installing git ... success"
fi        

