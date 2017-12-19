#!/bin/bash
bucle=0
nom=$1
while [ $bucle -eq 0 ]
do

	echo "1-Pedra
2-Paper
3-Tisores
4-Eixir"

	read eleccio
	
		case $eleccio in 
	
			1)
				Jugador1=Pedra
			
			;;
			2)
				Jugador1=Paper
				
			;;
			3)
				Jugador1=Tisores
		
			;;
			4)
				bucle=1
				
				./pedrapapertisores.sh $nom
			;;
			*)
				echo "T'has equivocat! "
				./PartidaIA.sh $nom
			;;
		esac
	
	eleccioMaquina=$((1+RANDOM%3))
		case $eleccioMaquina in 
	
			1)
				Maquina=Pedra
			;;
			2)
				Maquina=Paper
			;;
			3)
				Maquina=Tisores
			;;
		esac
	echo "La maquina trau $Maquina"
	 
	if [ "$Jugador1" = "Pedra" ]
	then 
		if [ "$Maquina" = "$Jugador1" ]
		then
			echo "Empate"
		fi
		if [ "$Maquina" =  "Paper" ]
		then
			echo "Has perdut! "
		fi
		if [ "$Maquina" =  "Tisores" ]
		then
			echo "Has guanyat! "
		fi
	fi
	if [ "$Jugador1" = "Paper" ]
	then 
		if [ "$Maquina" = "$Jugador1" ]
		then
			echo "Empate"
		fi
		if [ "$Maquina" =  "Pedra" ]
		then
			echo "Has guanyat! "
		fi
		if [ "$Maquina" =  "Tisores" ]
		then
			echo "Has perdut! "
		fi
	fi
	if [ "$Jugador1" = "Tisores" ]
	then 
		if [ "$Maquina" = "$Jugador1" ]
		then
			echo "Empate"
		fi
		if [ "$Maquina" =  "Paper" ]
		then
			echo "Has guanyat! "
		fi
		if [ "$Maquina" =  "Pedra" ]
		then
			echo "Has perdut! "
		fi
	fi
done
