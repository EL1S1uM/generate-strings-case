#!/bin/bash

# Usage: ./script.sh <string>

str=${1^^}  # convert to uppercase
len=${#str} # get length of string

for ((perm=0; perm <= len; perm++)); do
	for ((i=0; i <= len; i++)); do
		lower=${str,,}   # convert to lowercase
		# Uppercase n-th letter for permutation
		if [ $perm -gt 0 ]; then
			nth=${lower:perm-1}
			lower=$(echo ${lower:0:perm-1}${nth^})
		fi

		echo -n ${str:0:i} # print orig string from 0 to $i
		echo ${lower:i}    # print new string from $i to end
	done
done | sort -u
