mkfifo arx

nc -l 1234 < arx | ./pedrapapertisores2.sh > arx

rm -f arx