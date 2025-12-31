#!bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ] #ne=not eqaul
then 
    echo "ERROR:: you must have sudo access to excute this script"
    #exit 1 # used for if the above o/p is success and it should be any num other then 0
fi

yum list installed mysql # it will get o/p sql is installed or not
if [ $? -ne 0 ] # not installed mysql execute this stmnt
then  
    if [ $? -ne 0 ] # privious output will come here as input
    then    
        echo "Installing Mysql ...failure"
        exit 1 
    else
        echo "installing mysql ... success"
    fi
else # if sql instlled excute this stmt
    echo "mysql is already ...installed"
fi


yum list installed git
if [$? -ne 0] # if not istlled git
then 
    yum install git -y
    if [ $? -ne 0 ]
    then    
        echo "Installing git...failure"
        exit 1 
    else
        echo "installing git ... success"
    fi        

