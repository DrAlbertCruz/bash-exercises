#/bin/bash

# Algorithm 3 from Chapter 3 in the Rosen Discrete Structures textbook 7e. 
# Given a file of integers it will load the values into an array and then 
# perform a binary search. However, binary search requires the array to be
# sorted. So, this script is bundled with a bubble sort that runs before
# the binary search is performed.

# === INPUT VALIDATION ===
# They need to pass the file name as the second argument. It must contain the
# numbers to be processed, with \n delimiters.
file=$1
goal=$2
if ! [ -e "$file" ]; then
	echo "$0: File provided, $file, does not exist!"
	exit 1
fi
if [ -z "$2" ]; then
	echo "$0: An integer to search for must be provided as the second argument to the script."
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
# Now do the binary search
i=0
j=n
while ((i < j)); do
	m="$(( ( i + j ) / 2 ))" 
	# Bash arithmetic is always integer arithmetic. There is no need for
	# a floor() operation here.
	echo "$m: Investigating ${a[m]} ..."
	if ((goal > ${a[m]})); then
		i="$((m + 1))"
	else
		j=$m
	fi
done
if ((goal == ${a[i]})); then 
	echo "Found $goal at index $i"
else
	echo "Cannot find goal ..."
fi
