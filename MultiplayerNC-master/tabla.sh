#!/bin/bash
nom=$1

ECHO(){
	echo "POSICIÓN   NOMBRE   PUNTOS"
}
TORNAR(){
	./Usuaris/$nom.sh
}

TOP10(){
	ECHO

	jugador=`cat BaseDeDades.txt | cut -d" " -f1,3 | sort -nrk2 | head -10`
	for (( i = 1; i < 11; i++ )); do
		user=`echo "$jugador" | head -$i | tail -1`
		echo " $i.	   $user"
	done
}

TODOS(){
	cantidad=`awk 'END{print NR}' BaseDeDades.txt`
	ECHO

	jugador=`cat BaseDeDades.txt | cut -d" " -f1,3 | sort -nrk2`
	for (( i = 1; i < $cantidad+1; i++ )); do
		user=`echo "$jugador" | head -$i | tail -1`
		echo "$i $user"
	done
}

MIPOSICION(){
	cantidad=`awk 'END{print NR}' BaseDeDades.txt`
	ECHO

	jugador=`cat BaseDeDades.txt | cut -d" " -f1,3 | sort -nrk2`
	for (( i = 1; i < $cantidad+1; i++ )); do
		user=`echo "$jugador" | head -$i | tail -1`
		meme[$i]="$i $user\n"
	done
	echo -e "${meme[*]}" | grep $nom
}

bucle=0
while [ $bucle -eq 0 ]
do
	echo "1.- Top 10"
	echo "2.- Todos los jugadores"
	echo "3.- Mi posición"
	echo "4.- Volver"
	read a

	case $a in
		1)
			TOP10
			;;
		2)
			TODOS
			;;
		3)
			MIPOSICION
			;;
		4)
			TORNAR
			;;
		*)
			echo "Opción incorrecta"
			;;
	esac
done