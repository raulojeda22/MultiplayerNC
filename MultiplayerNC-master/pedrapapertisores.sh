#!/bin/bash
nom=$1
	source functions.txt
eixirpaper=0
while [ $eixirpaper -eq 0 ]
do	
	echo "---MENU---
	1- Contra ordinador
	2- Crear partida
	3- Buscar partida
	4- Eixir al menú principal
	5- Eixir del joc"
	

	read a
	case $a in
		1)
			eixirpaper=1
			./PartidaIA.sh $nom
		;;

		2)
			joseSiempre=0
			while [ $joseSiempre -eq 0 ]
			do 
				aleatorio=`echo $((1+$RANDOM%1000))`
				partidesjacreades=`ls -l gamesppt | wc -l`
				comodi=1
				creala=0
				
					while [ $comodi -lt $partidesjacreades ]
					do	
						let comodi=$comodi+1 					
						aquestaPartida=`ls -l gamesppt | tr -s " " |cut -d" " -f9 | head -$comodi | tail -n -1` 
						if [ "game$aleatorio" = "$aquestaPartida" ]
						then
							creala=1
						fi
					done 
			
				
				if [ $creala -eq 0 ]
				then
					echo "$nom ha creat la partida $aleatorio" >> PartidesActuals.txt
					echo "Nº de partida: $aleatorio"
					mkdir gamesppt/game$aleatorio
					cd gamesppt/game$aleatorio
					touch $nom.sh server.sh carga.sh
					chmod 777 *.sh
					jugador > $nom.sh
					server > server.sh
					cargapedrapapertisores > carga.sh
					cargapedrapapertisoreseleccions > cargapedrapapertisoreseleccions.sh
					continuarono > continuarono.sh
					joseSiempre=1
					eixirpaper=1
					./$nom.sh $nom
				else
					echo -n
				fi
			done
		;;

		3)
			joseSiempre=0
			while [ $joseSiempre -eq 0 ]
			do
				cat PartidesActuals.txt
				echo -n "Introdueix el Nº de partida: "
				read key
			
				entra=0
									
				aquestaPartida=`cat PartidesActuals.txt | grep -w $key$ | wc -l` 
				if [ "0" = "$aquestaPartida" ]
				then
					entra=1
				fi
						#hem vaig quedar ací
				if [ $entra -eq 0 ]
				then
					sed "/$key$/ d" PartidesActuals.txt > Partides.tmp | mv Partides.tmp PartidesActuals.txt
					cd gamesppt/game$key
					touch $nom.sh
					chmod 777 *.sh
					jugador > $nom.sh
					eixirpaper=1
					
					./$nom.sh $nom
					
				else
						echo "Esta partida no existe :(. Vuelve a intentar :). "
						echo -n
				fi
			done
		;;
		4)
		eixirpaper=1
		./Usuaris/$nom.sh $nom
		;;
		5)
		eixirpaper=0
		exit
		;;
		*)
		echo "Comandament Erroni"
		;;
	esac
done
