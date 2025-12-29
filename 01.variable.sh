NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date)
echo "print the time":$TIMESTAMP
SUM=$(($NUMBER1+$NUMBER2))
MULTIPLE=$(($NUMBER1*$NUMBER2))
echo "print the sum of $NUMBER1 & $NUMBER2 is":$SUM
echo " print the multiple of $NUMBER1 and $NUMBER2 is":$MULTIPLE 