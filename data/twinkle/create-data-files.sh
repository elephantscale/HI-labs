#!/bin/bash

## creates large *text* files (dd creates binary files)
## usage :
##    1) modify the number of iterations (in for loop, around 24 will
##       give you 1G data)
##    2) run as :  ./create-data-files.sh
##       this will create a bunch of *.data files with various sizes


if [ ! -e a.data ]
then
        if [ ! -e sample.txt ]
        then
            echo "sample.txt not found.. exiting"
            exit 1
        fi

        cat sample.txt > a.data
        rm -f a1.data
        for i in {1..24}
        do
                cat a.data   a.data >> a1.data
                mv a1.data a.data
        done
fi

## creates multiple sized files
dd  if=a.data  of=1M.data  bs=1048576   count=1   #  1 M file
dd  if=a.data  of=10M.data  bs=1048576   count=10 #  10 M file
dd  if=a.data  of=100M.data  bs=1048576   count=100 #  100 M file
dd  if=a.data  of=500M.data  bs=1048576   count=500 #  500 M file
dd  if=a.data  of=1G.data  bs=1048576   count=1000 #  1G file
