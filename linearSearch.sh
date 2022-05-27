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
# Read the file into an array
length=0
array=()
while read -r line; do
	echo "The next line in the file is ${line}."
	array+=("$line")
	((length++))
done < "$file"
echo "Done reading file, ${length} lines were read."
# Now do the linear search
p=0
while ((p < length)); do
	((p++))
	element=${array[p]}
	echo "Checking value ${element}"
	if ((element == value)); then 
		break
	fi
done
if ((p == length)); then
	echo "Value not found"
else
	echo "Value $value found at line $((p+1))" # People don't zero index
fi
