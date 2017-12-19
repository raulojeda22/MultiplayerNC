mkfifo arx3

nc -l 6666 < arx3 | ./pedrapapertisores2.sh > arx3

rm -f arx3