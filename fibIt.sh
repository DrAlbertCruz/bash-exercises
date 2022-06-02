#!/bin/bash
# Bash is not the same as C. However, since this algorithm is linear cost, perhaps it is OK to implement it
# entirely in bash. 

# === INPUT VALIDATION ==
# If argument $1 is provided its length will be non-zero
if [ -z "$1" ]
	then
		echo "Usage: ./fib N ... where N is the index of the Fibonacci number"
		exit 0
fi
# === CODE ===
# The code itself.
VAR1=0 # First fib number
VAR2=1 # Second fib number
N=0 # Start count at 0
while [ $N -le $(($1-2)) ] # Count is n-2, this loop should start at 2
do
	VAR3=$(( $VAR1 + $VAR2 )) # temp = first + second
	VAR1=$(( $VAR2 )) # first = second
	VAR2=$(( $VAR3 )) # second =t emp
	echo Iter: $N # Print out iteration count
	((N++)) # n++
done
echo "The ${N}-th Fibonacci number is ${VAR2}" # Display result
