#!bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -eq 0 ] #$?privious output will come here as input
    then    
        echo "$2 ...failure"
        exit 1
    else
        echo "$2 ... success"
    fi
}

if [ $USERID -ne 0 ] #ne=not equal
then 
    echo "ERROR:: you must have sudo access to excute this script"
    exit 1 #other then 0
fi

yum list installed mysql

if [ $? -eq 0 ]
then  
    yum install mysql -y
    VALIDATE $? "Installing Mysql" # here validate is the function, $? is arg1, installing mysql is arg2.
else
    echo "mysql is already ...installed"
fi




yum list installed git

if [ $? -eq 0 ]
then    
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is aleady ... Installed"
fi        

