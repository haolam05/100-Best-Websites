#!/bin/bash

if [ $# -ne 2 ]
then
	echo Need exactly 2 arguments	
	exit 1
fi

if [ ! -f $1 ]
then
	echo "${1}: file does not exist!"
	exit 1
fi

rank=1
while read line
do
	url=$line
	size=`./perform-measurement.sh $url`

	#print message to output
	echo "Performing measurement on $url"

	if [ $size -gt 0 ]
	then
		echo ...success
	else
		echo ...failed
	fi
	
	#write result to file
	if [ $size -gt 0 ]
	then
		echo "$rank $url $size" >> $2
	fi

	(( rank = $rank + 1 ))
done < $1

exit 0
