
    ENTRAR_PARTIDA () {

        joseSiempre=0 
                while [ $joseSiempre -eq 0 ]
                do
                    cat PartidesActuals$nomDelJoc.txt
                    echo -n "Introdueix el Nº de partida: "
                    read key

                    entra=0

                    aquestaPartida=`cat PartidesActuals$nomDelJoc.txt | grep -w $key$ | wc -l`
                    if [ "0" = "$aquestaPartida" ]
                    then
                        entra=1
                    fi

                    if [ $entra -eq 0 ]
                    then
                    participants=`cat games$nomDelJoc/game$key/participants$nomDelJoc.txt`
                        if [ $participants -lt 2 ]   #aquí puedes poner el numero de participantes que quieras.
                        then
                            let participants=$participants+1
                            echo "$participants" > games$nomDelJoc/game$key/participants$nomDelJoc.txt
                            
                            cd games$nomDelJoc/game$key
                            touch $nom.sh
                            chmod 777 *.sh
                            jugador > $nom.sh
                            eixirpaper=1
                            joseSiempre=1
                            ./carga.sh $nom "O" "X"
                        else
                        sed "/$key$/ d" PartidesActuals$nomDelJoc.txt > Partides$nomDelJoc.tmp | mv Partides$nomDelJoc.tmp PartidesActuals$nomDelJoc.txt
                        echo "Partida completa"
                        fi
                    else
                            echo "Esta partida no existe :(. Vuelve a intentar :). "
                            echo -n
                    fi
                done
        }
    

    CREAR_PARTIDA () {
        joseSiempre=0
                while [ $joseSiempre -eq 0 ]
                do
                    aleatorio=`echo $((1+$RANDOM%1000))` #Si quieres que hayan más de 1000 partidas simultáneas o menos cambia el número
                    partidesjacreades=`ls -l games$nomDelJoc | wc -l`
                    comodi=1
                    creala=0

                        while [ $comodi -lt $partidesjacreades ]
                        do
                            let comodi=$comodi+1
                            aquestaPartida=`ls -l games$nomDelJoc | tr -s " " |cut -d" " -f9 | head -$comodi | tail -n -1`
                            if [ "game$aleatorio" = "$aquestaPartida" ]
                            then
                                creala=1
                            fi
                        done


                    if [ $creala -eq 0 ]
                    then
                        echo "$nom ha creat la partida $aleatorio" >> PartidesActuals$nomDelJoc.txt
                        echo "Nº de partida: $aleatorio"
			mkdir -p games$nomDelJoc
                        mkdir games$nomDelJoc/game$aleatorio
                        cd games$nomDelJoc/game$aleatorio
                        touch $nom.sh server.sh carga.sh
                        echo "1" > participants$nomDelJoc.txt
			            jugador > $nom.sh
                        carga > carga.sh
                        server > server.sh  
			touch casillas.txt posicionX.txt posicionO.txt
			echo "3 5" > posicionX.txt
			echo "7 5" > posicionO.txt
                        #Aquí puedes poner las funciones que quieras, nosotros ponemos las predeterminadas para 
                        #cualquier juego online como la carga para comprobar que todos hayan introducido algo
                        #y server para cargar el ganador
                        chmod 777 *.sh
                        joseSiempre=1
                        #Aquí puedes poner que entre a la partida o salga al menú. Está como predeterminado salir al menú.
                        ./$nom.sh $nom "X" "O"
                    else
                        echo -n
                    fi
                    
                done
        }

    

	#MAIN PROGRAM
     nom=$1
    ###################Escribe aquí el nombre del juego que quieras##################
    nomDelJoc="OnePunch"
	source $nomDelJoc/funcionsPredeterminades.txt
    echo "1.Crear partida"
    echo "2.Entrar a partida"
    read numeros
	estebanElMusic=0
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
    
