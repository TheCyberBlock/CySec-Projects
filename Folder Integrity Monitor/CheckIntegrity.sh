#!/bin/bash

dtreetrawl -f -F -t -d ":" --hash $1 > /tmp/.tmp
head -n -2 /tmp/.tmp > /tmp/.tmp2

echo "***************************"
echo "Differences from last hash"
echo "***************************"
diff $2 /tmp/.tmp2