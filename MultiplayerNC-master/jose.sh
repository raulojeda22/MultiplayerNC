
#!/bin/bash 

#CONTADOR=33099
#MAX=33110

for (( i = 33100; i < 33110; i++ )); do
	echo "$i" > contador.txt
	gnome-terminal -e "bash -c ./obrirports.sh;bash"
	sleep 0.1
done

#while [ $CONTADOR -lt $MAX ]; do
#	let CONTADOR=CONTADOR+1  
#	echo "$CONTADOR" > contador.txt

#	gnome-terminal -e "bash -c ./obrirports.sh;bash"
	
#done
	gnome-terminal
	gnome-terminal
	gnome-terminal -e "bash -c ./kill.sh;bash"
	let jug=$i-33100
	echo "Hi han $jug jugadors posibles"

tamare=0

while [ $tamare -eq 0 ]; do
	contadorports=`netstat -nt | grep  :331 | wc -l`

	let contadorports=$contadorports+33101

	echo  "$contadorports" > ElsPorts.txt 

	cat ElsPorts.txt | nc -l 33026 
done
