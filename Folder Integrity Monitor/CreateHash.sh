#!/bin/bash

dtreetrawl -f -F -t -d ":" --hash $1 > $2
head -n -2 $2 > /tmp/.hashdata 
mv /tmp/.hashdata $2

echo "***********************************"
echo "Secure Hash Created at $2"
echo "***********************************"