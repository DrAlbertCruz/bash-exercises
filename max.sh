#/bin/bash

# Algorithm 1 from Chapter 3 in the Rosen Discrete Structures textbook 7e. It 
# should perform a linear search to find the maximum value in an array.

# === INPUT VALIDATION ===
# They need to pass the file name as the second argument. It must contain the
# numbers to be processed, with \n delimiters.
file=$1
if ! [ -e "$file" ]; then
	echo "$0: The file '$file' does not exist!"
	exit 1
fi

# === CODE ===
# Read the file into an array
array=()
length=0
while read -r line; do
	echo "Next line in the file is ${line}"
	array+=("$line")
	((length++))
done < $file
# Preload max with the first element in the array
max=${array[0]}
echo "Current max value is ${max}"
n=0
while ((n < length)); do
	element=${array[n]}
	echo "The counter is currently ${n} and the next element in the array is ${element}"
	if ((element > max)); then
		echo "It is greater than ${max}, so it will replace it."
		max=$element
	fi
	((n++))
done
echo "Max value in the array is ${max} on line ${n}."
