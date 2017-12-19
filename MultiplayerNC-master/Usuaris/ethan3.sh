nom=$1
	source functions.txt

	echo "---MENU---
	1- Contra ordinador
	2- Crear partida
	3- Buscar partida"
	read a

	case $a in
		1)
			./PartidaIA.sh $nom
		;;

		2)
			aleatorio=`echo $((1+$RANDOM%100))`
			echo "Nº de partida: $aleatorio"
			mkdir game$aleatorio
			cd game$aleatorio
			touch $nom.sh server.sh carga.sh
			chmod 777 *.sh
			jugador > $nom.sh
			server > server.sh
			carga > carga.sh
			./$nom.sh $nom
		;;

		3)
			echo -n "Introdueix el Nº de partida: "
			read key
			cd game$key
			touch $nom.sh
			chmod 777 *.sh
			jugador > $nom.sh
			./$nom.sh $nom
		;;
	esac
