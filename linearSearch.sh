#/bin/bash

# Algorithm 2 from Chapter 3 in the Rosen Discrete Structures textbook 7e. It 
# will perform a linear search in an array. It assumes the value you're look-
# ing for is passed as the second argument ($2)

# === INPUT VALIDATION ===
# They need to pass the file name as the second argument. It must contain the
# numbers to be processed, with \n delimiters.
file=$1
value=$2
if ! [ -e "$file" ]; then
	echo "$0: File provided, $file, does not exist!"
	exit 1
fi
if [ -z "$value" ]; then
	echo "$0: There must be a second argument provided, the number you are looking for!"
	exit 1
fi

# === CODE ===
# Use cat and wc -l to get the length of the file
length=$(cat $file | wc -l)
N=0
while (($N < $length)); do
	((N++))
	# Use head and tail to perform random access on a specific line in the
	# file
	a=$(head -n $N $file | tail -1)
	echo "Checking value ${a}"
	if (($a == $value)); then 
		break
	fi
done
if (($N == $length)); then
	echo "Value not found"
else
	echo "Value $value found at line $N"
fi
