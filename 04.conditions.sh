#!bin/bash

NUMBER=$1

# -gt, -lt, -eq, -ge, -le
if [ $NUMBER -gt 100 ]
then
    echo "Given number is greater then 100"
else
    echo "Given number is less then or equal to 100"
fi  # ending the if condition