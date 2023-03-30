#!/bin/bash

#check number of arguments
if [ $# -ne 2 ]
then
	echo Need exactly 2 arguments!
	exit 1
fi

#check file existance
if [ ! -f $1 ]
then
	echo "${1}: file does not exist!"
	exit 1
fi

#save downloaded content from arg $1 url to $2 output file
grep -n '<strong>.*http://' $1 | sed 's/\(.*\)="//' | sed 's/\/"\(.*\)//' > $2

#success
exit 0
