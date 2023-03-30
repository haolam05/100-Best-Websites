#!/bin/bash

#exit 1 if number of arguments is not 1
if [ $# -ne 1 ]
then
	echo Need exactly 1 argument!
	exit 1
fi

#save downloaded file to a custom file -> easier to manipulate
#q: turns off wget output
custom_file_name="output"
wget --tries=1 -qO $custom_file_name $1 

#get file size
file_size="`cat $custom_file_name | wc -c`"

#delete custom file
rm $custom_file_name

#success - Size: file_size bytes
#if errorneous args -> can't download -> output will be "0"
echo ${file_size}
exit 0
