#/bin/bash

# A function that will generate 10,000 random integers and place them in the
# file array1.
FILENAME=array1

touch $FILENAME # Touch it in case it does not exist
N=0
while ((N < 100)); do
	number=$RANDOM
	if ((N == 0)); then
		echo "${number}" > $FILENAME
	else
		echo "${number}" >> $FILENAME
	fi
	((N++))
done
