#!/bin/bash
# Create Directory in Desktop

pwd=`pwd`
echo  "Enter a Name For New Directory:\n"
read DIR
cd /Desktop 2>/dev/null
mkdir $DIR
echo "Create Directory Successfully..\t"
