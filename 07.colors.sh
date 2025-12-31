#!bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
y="\e[31m"

VALIDATE(){
    if [ $1 -ne 0 ] #$?privious output will come here as input
    then    
        echo "$2 ...$R failure"
        exit 1
    else
        echo "$2 ... $G success"
    fi
}

if [ $USERID -ne 0 ] #ne=not equal
then 
    echo "ERROR:: you must have sudo access to excute this script"
    exit 1 #other then 0
fi

yum list installed mysql

if [ $? -ne 0 ]
then  
    yum install mysql -y
    VALIDATE $? "Installing Mysql" # here validate is the function, $? is input1, installing mysql is input2.
else
    echo "mysql is already ...$Y installed"
fi




yum list installed git

if [ $? -ne 0 ]
then    
    yum install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is aleady ... $Y Installed"
fi        

