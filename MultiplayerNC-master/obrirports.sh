#!/bin/bash
contator=`cat contador.txt`

echo "$contator"
Infinit=0

while [ $Infinit -eq 0 ]
do

	rm -f arx/arx$contator
	mkfifo arx/arx$contator

	nc -l $contator < arx/arx$contator | ./pedrapapertisores2.sh > arx/arx$contator

	rm -f arx/arx$contator
done
