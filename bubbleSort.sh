#/bin/bash

# Algorithm 4 from Chapter 3 in the Rosen Discrete Structures textbook 7e. 
# Given a file of integers it will load the values into an array and then 
# sort the array. The sorting algorithm is bubble sort.

# === INPUT VALIDATION ===
# They need to pass the file name as the second argument. It must contain the
# numbers to be processed, with \n delimiters.
file=$1
if ! [ -e "$file" ]; then
	echo "$0: File provided, $file, does not exist!"
	exit 1
fi

# === CODE ===
# Read the file into an array
n=0
a=()
while read -r line; do
	echo "The next line in the file is ${line}."
	a+=("$line")
	((n++))
done < "$file"
echo "Done reading file, ${n} lines were read."
# Now do the bubble sort
i=0
while ((i < n)); do
	j=0
	echo "On iteration ${i}"
	while ((j < n - i)); do
		echo "${i}: On iteration ${j}"
		if ((${a[j]} > ${a[j + 1]})); then
			echo "${i}: Need to swap ${a[j]} and ${a[j + 1]}."
			temp=${a[j]}
			a[j]=${a[j+1]}
			a[j + 1]=$temp
		fi
		((j++))
	done
	((i++))
done
# Print out the array to show it's sorted
for i in "${a[@]}"; do
	echo "Next element is ${i}"
done
