#!/bin/bash
#Un script pal client en el que introduïsca els 20 números del bingo, es guarden en una array i un script del servidor que no comense fins que tots hagen escrit que volen comensar.
#El servidor fa un numero aleatori, si eixe número ja ha isit el canvia per un altre fins que isca uno que encara no haja isit
#el client està continuament analizant la última línea del fitxer que va canviant-se cada vegada que is una nova comprovant. Al canviar analitza altra volta la seua array i si hi ha un valor coincident el canvia a una x. Si tots els valors de la array son x, es guarda el teu nom en el fitxer de guanyador. I els apareix a tots.
nom=$1
ARRAY_ALEATORIA () {
	numeroDeNumeros="0"
	while [ $numeroDeNumeros -le 15 ]
	do

		array=$(($RANDOM%99))
		echo "${numerosBingo[*]}"
		numerosBingo[$numeroDeNumeros]="$array"
		let numeroDeNumeros=$numeroDeNumeros+1
	done

}


ARRAY_ESCRITA () {

#DE MOMENT NO NEM A UTILITZAR AQUSTA FUNCIÓ
echo "Funció que no va a ser utilitzada"

	#NumeroDeNumeros="0"
	#while [ $NumeroDeNumeros -lt 21 ]
	#do
	#	echo "Casella $NumeroDeNumeros: "
	#	read Array
	#	if [ $Array -lt 100 ]
	#	then
	#		echo "El número debe ser menor de 100"
	#	fi
	#	NumerosBingo[$NumeroDeNumeros]="$Array"




	#done

}

LOTERIA(){
	contador=0
	while true
		do
		resultatBingo=`cat resultatBingo.txt | cut -d" " -f$contador`
		let contador=$contador+1
		elBingo=`echo "${numerosBingo[*]}"`
		numeroDeNumeros="0"
		for aquestNumero in $elBingo
		do
			if [ $aquestNumero -eq $resultatBingo ] 
			then
				numerosBingo[$numeroDeNumeros]="X"
			fi
			let numeroDeNumeros=$numeroDeNumeros+1
		done
		echo "${numerosBingo[*]}"
		echo "Pulsa enter per a continuar: "
		read dsfjhdasdasfdsff
	done

}
CREAR_PARTIDA(){

			joseSiempre=0
			while [ $joseSiempre -eq 0 ]
			do
				aleatorio=`echo $((1+$RANDOM%1000))`
				partidesjacreades=`ls -l gamesBingo | wc -l`
				comodi=1
				creala=0

					while [ $comodi -lt $partidesjacreades ]
					do
						let comodi=$comodi+1
						aquestaPartida=`ls -l gamesBingo | tr -s " " |cut -d" " -f9 | head -$comodi | tail -n -1`
						if [ "game$aleatorio" = "$aquestaPartida" ]
						then
							creala=1
						fi
					done


				if [ $creala -eq 0 ]
				then
					echo "$nom ha creat la partida $aleatorio" >> PartidesActualsBingo.txt
					echo "Nº de partida: $aleatorio"
					mkdir gamesBingo/game$aleatorio
					cd gamesBingo/game$aleatorio
					touch $nom.sh server.sh carga.sh
					echo "1" > participantsBingo.txt
					carga > carga.sh
					server > server.sh
					chmod 777 *.sh
					numerosBingoCreador[0]="0"
					numeroDeNumeros=0
					echo "Creant partida..."
					while [ $numeroDeNumeros -lt 99 ]
					do
						ok=0
						array=$(($RANDOM%99))
						bingoCreador=`echo "${numerosBingoCreador[*]}"`
						for numeret in $bingoCreador
						do
							if [ $numeret -eq $array ]
							then
								echo -n
								ok=0
								break
							else
								ok=1
							fi
						done
						if [ $ok -eq 1 ]
						then
							numerosBingoCreador[$numeroDeNumeros]="$array"
							let numeroDeNumeros=$numeroDeNumeros+1
							echo "${numerosBingoCreador[*]}" > resultatBingo.txt
						fi
					done
					joseSiempre=1
					echo "Partida creada, ara pots entrar a la teva propia partida!"
					read asdfasdfasdfda
					cd ../..
					./Usuaris/$nom.sh $nom
				else
					echo -n
				fi
				
			done


}
ENTRAR_PARTIDA(){


			joseSiempre=0
			while [ $joseSiempre -eq 0 ]
			do
				cat PartidesActualsBingo.txt
				echo -n "Introdueix el Nº de partida: "
				read key

				entra=0

				aquestaPartida=`cat PartidesActualsBingo.txt | grep -w $key$ | wc -l`
				if [ "0" = "$aquestaPartida" ]
				then
					entra=1
				fi

				if [ $entra -eq 0 ]
				then
				participants=`cat gamesBingo/game$key/participantsBingo.txt`
					if [ $participants -lt 6 ]
					then
						let participants=$participants+1
						echo "$participants" > gamesBingo/game$key/participantsBingo.txt
						
						cd gamesBingo/game$key
						touch $nom.sh
						chmod 777 *.sh
						jugador > $nom.sh
						eixirpaper=1
						joseSiempre=1
						./$nom.sh $nom
					else
					sed "/$key$/ d" PartidesActualsBingo.txt > PartidesBingo.tmp | mv PartidesBingo.tmp PartidesActualsBingo.txt
					echo "Partida completa"
					fi
				else
						echo "Esta partida no existe :(. Vuelve a intentar :). "
						echo -n
				fi
			done
}

source functionsBingo.txt
estebanElMusic=0
echo "Bingo"
echo "1.Crear partida"
echo "2.Entrar a partida"
read numeros
while [ $estebanElMusic -eq 0 ]
do
	case $numeros in
		1)
			CREAR_PARTIDA
			estebanElMusic=1
		;;
		2)
			ENTRAR_PARTIDA
			estebanElMusic=1
		;;
		*)
		;;
	esac
done
LOTERIA
