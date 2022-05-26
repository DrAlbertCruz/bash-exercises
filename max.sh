#/bin/bash

# Algorithm 1 from Chapter 3 in the Rosen Discrete Structures textbook. It 
# should perform a linear search to find the maximum value in an array.

# === INPUT VALIDATION ===
# They need to pass the file name as the second argument. It must contain the
# numbers to be processed, with \n delimiters.
file=$1
if ! [ -e "$file" ]; then
	echo "$0: $file does not exist!"
	exit 1
fi

# Preload max with the first element in the file using `head`
max=$(head -n 1 $file)
echo "Current max value is ${max}"
# We don't need an index because you can iterate over lines in a file in bash
while read -r line; do
	echo "Next line in file is ${line}"
	if (($line > $max)); then
		echo "It is greater than ${max}, so it will replace it."
		max=$line
	fi
done < "$file"
echo "Max value in the array is ${max}."
