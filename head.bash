#!/bin/bash

rm -rf test_*.txt

file="$1"

l=1
k=100

for i in {1..2}
 do
 
   echo "l is $l,k is $k"

  sed -n -e "$l,$k p" $file  > test_${i}.txt
    l=`expr $l + 100`
    k=`expr $k + 100`
    echo "now l is $l,k is $k"
done


