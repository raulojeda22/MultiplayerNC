mkfifo arx4

nc -l 4444 < arx4 | ./pedrapapertisores2.sh > arx4

rm -f arx4