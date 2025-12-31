#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] #ne=not eqaul
then 
    echo "ERROR:: you must have sudo access to excute this script"
    # exit 1 # is used for if above stmt is failed thn the excution have to stop here and it should be any num other then 0
fi

yum list installed mysql-server # it will get o/p sql is installed or not
if [ $? -ne 0 ] # not installed mysql execute this stmnt
then  
    yum install mysql-server -y
    if [ $? -ne 0 ] # privious output will come here as input
    then    
        echo "Installing Mysql-server ...failure"
        exit 1 
    else
        echo "installing mysql-server ... success"
    fi
else # if sql instlled excute this stmt
    echo "mysql-server is already ...installed"
fi


yum list installed git
if [ $? -ne 0 ] # if not istlled git
then 
    yum install git -y
    if [ $? -ne 0 ]
    then    
        echo "Installing git...failure"
        exit 1 
    else
        echo "installing git ... success"
    fi        
else # if sql instlled excute this stmt
    echo "git is already ...installed"
fi