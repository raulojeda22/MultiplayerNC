mkfifo arx2

nc -l 12345 < arx2 | ./pedrapapertisores2.sh > arx2

rm -f arx2