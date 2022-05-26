#/bin/bash

# Algorithm 1 from Chapter 3 in the Rosen Discrete Structures textbook. It should perform a linear search to find the maximum value in an array.

# Just some array
array=(182 18 1 992 2 8 9 10 11 71 72)
length=11
max=${array[1]}
N=0
while ((N < length)); do
	if ((max < ${array[N]})); then
		max=${array[N]}
	fi
	((N++))
done
echo "Max value in the array is ${max}."
