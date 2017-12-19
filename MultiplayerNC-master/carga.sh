
	nom=$1
    ###########################ESCRIBE AQUÍ EL NÚMERO DE PARTICIPANTES#####################
    $numeroDeParticipantes="2"
	echo "Espera a que acaben els demés..."
	echo
	linies=`cat resultatsGlobals.txt | wc -l`		

	while [[ $linies -lt $numeroDeParticipantes ]]; do
		linies=`cat resultatsGlobals.txt | wc -l`
	done

	if [[ $linies -eq $numeroDeParticipantes ]]; then
		./server.sh $nom
	fi
