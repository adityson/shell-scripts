#!/bin/bash

# When moving files from NTFS system to Linux system, the files have default permission of 777.
# This script converts each such file in the given directory to file with 644 permission.

# Environment variable IFS is internal field separator which defines field separators in bash.
IFS=$'\n'

# Find files with permission 777 in directory given as first argument.
for file in $(find "$1" -perm -777)
do
    chmod 644 "$file"
    echo "$file"
done

# if above for loop exits with code 0
if [ "$?" -eq 0 ]
then
    echo "Task Successful"
else
    echo "Task Failed"
fi
