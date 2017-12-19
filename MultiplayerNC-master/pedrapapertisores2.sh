#!/bin/bash
source functions.txt
echo "Conectat"
eixir=0
while [ $eixir -eq 0 ]
do
echo "Ja tens un compte d'usuari? [S/n]"
read a
case $a in
	S)
		echo "Introdueix nom d'usuari: "
		read I
		echo "Contrasenya: "
		read C
		
		#comprovar si la contrasenya es correcta
		psswd=`grep ^$I BaseDeDades.txt | cut -d" " -f2`
		
			if [[ "$psswd" = "$C" ]]; then
					#statements
					echo "Conectat"
					eixir=1
					usuari > Usuaris/$I.sh
					./Usuaris/$I.sh $I
				else
					echo "Contrasenya incorrecta"
			
		fi
	;;
	s)
		echo "Introdueix nom d'usuari: "
		read I
		echo "Contrasenya: "
		read C

		#comprovar si la contrasenya es correcta
		psswd=`grep ^$I BaseDeDades.txt | cut -d" " -f2`
		
			if [[ "$psswd" = "$C" ]]; then
					#statements
					echo "Conectat"
					eixir=1
					usuari > Usuaris/$I.sh
					./Usuaris/$I.sh $I
				else
					echo "Contrasenya incorrecta"
			fi
		
	;;
	
	n)
		echo "Crea nom d'usuari: "
		read n

		echo "Contrasenya: "
		read p

					
		
		NomDeLaBaseDeDades=`grep ^$n BaseDeDades.txt | cut -d" " -f1`
		if [ "$NomDeLaBaseDeDades" = "$n" ] 
		then
			echo "Ho sentim, però el nom ja està en ús :("
			read kjlsdf
					
			
		else
		


		echo "$n $p 0" >> BaseDeDades.txt
		touch Usuaris/$n.sh
		chmod 777 Usuaris/*.sh
		usuari > Usuaris/$n.sh
		eixir=1
		./Usuaris/$n.sh $n
		fi
	;;
	N)
		echo "Crea nom d'usuari: "
		read n

		echo "Contrasenya: "
		read p


					
		
		NomDeLaBaseDeDades=`grep ^$n BaseDeDades.txt | cut -d" " -f1`
		if [ "$NomDeLaBaseDeDades" = "$n" ] 
		then
			echo "Ho sentim, però el nom ja està en ús :("
			read kjlsdf
					
			
		else
		


		echo "$n $p 0" >> BaseDeDades.txt
		touch Usuaris/$n.sh
		chmod 777 Usuaris/*.sh
		usuari > Usuaris/$n.sh
		eixir=1
		./Usuaris/$n.sh $n
		fi
	;;
	*)
		echo "Introducció incorrecta"
	;;
esac
done
