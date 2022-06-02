#!/bin/bash
# This is a recursive implementation of Fibonacci in bash. Note that while bash can indeed implement recursion,
# it is not a good practice to do so. In practice, you should use the iterative version. Or, in general, any
# C-code implementation will be better than these bash exercises.

### === INPUT VALIDATION ===
# They need to provide an integer as the first argument in the command line.
n=$1
if [ -z $n ]; then
	echo "$0: Need to provide an integer as the first argument."
	exit 1
fi

### === CODE ===
fib () (
	local n=$1 						# Shadow input value into local scope
	local temp=0					# Instantiate a local variable for holding
	if (( n == 0)); then			# ... result of first call to Fib
		return 0
	elif (( n == 1 )); then
		return 1
	fi
	fib $n 							# First recursive call to fib
	temp=$?							# Shadow result into local variable space
	fib $(( n - 1 ))				# Second call to fib
	result=(( $? + $temp ))	
	return $result					# Return result of second call plus `temp`
	)

p=$(( fib n ))
echo "The ${n}-the Fibonacci number is ${p}"
