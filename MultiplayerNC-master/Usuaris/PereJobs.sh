nom=$1
echo "
		{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[

		>>>							         	       <<<
		>>>>>>					                                    <<<<<<
		>>>>>>>>>                                                                <<<<<<<<<
		>>>>>>>>>>>>                                                          <<<<<<<<<<<<
		>>>>>>>>>>>>>>>       	    __  __ ______ _   _ _ // _             <<<<<<<<<<<<<<<
		>>>>>>>>>>>>>>>>>>    	   |  \/  |  ____| \ | | |  | |         <<<<<<<<<<<<<<<<<<
		>>>>>>>>>>>>>>>>>>    	   | \  / | |__  |  \| | |  | |         <<<<<<<<<<<<<<<<<<
		>>>>>>>>>>>>>>>       	   | |\/| |  __| | . | | |  | |            <<<<<<<<<<<<<<<
		>>>>>>>>>>>>          	   | |  | | |____| |\  | |__| |               <<<<<<<<<<<<
		>>>>>>>>>             	   |_|  |_|______|_| \_|\____/                   <<<<<<<<<
		>>>>>>                                                                      <<<<<<
		>>>                                                                  	       <<<
                
		|********************************************************************************|
		|///////////////////////////{[TRIA EL TEU JOC FAVORIT]}//////////////////////////|
		|********************************************************************************|
	

		{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}}{}{}{}{}{}{}{}{}{}{}{{}{}{}{}{}{}{}{}{}{}
		|/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*|
						1.- PEDRA PAPER TISORES

						2.- BINGO
	
						3.- TRES EN RALLA 
	
						4.- ONE PUNCH
						
						5.- KIT DE DESARROLLO

						6.- TABLA DE PUNTUACIÓ
						
						7.- EIXIR 
						
						8.- RPG
		|/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*|
		{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}}{}{}{}{}{}{}{}{}{}{}{{}{}{}{}{}{}{}{}{}{}	
	   		  __  __       _ _   _       _                       _   _  _____ 
		         |  \/  |     | | | (_)     | |                     | \ | |/ ____|
		         | \  / |_   _| | |_ _ _ __ | | __ _ _   _  ___ _ __|  \| | |     
		         | |\/| | | | | | __| | |_ \| |/ _| | | | |/ _ \ |__| . | | |     
		         | |  | | |_| | | |_| | |_) | | (_| | |_| |  __/ |  | |\  | |____ 
		         |_|  |_|\__,_|_|\__|_| |__/|_|\__,_|\__, |\___|_|  |_| \_|\_____|
		                              | |             __/ |                       
		                              |_|            |___/                        

		{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]}{[]"

elegirjoc=0
while [ $elegirjoc -eq 0 ]
do
read tria
	case $tria in
			1)
				elegirjoc=1
				./pedrapapertisores.sh $nom
			;;

			2)
				elegirjoc=1
				./bingo.sh $nom
			;;
		
			3)
				elegirjoc=1
				./tresenralla/tresenralla.sh $nom
			;;
			
			4)
				elegirjoc=1
				./OnePunch/OnePunch.sh $nom
			;;
			
			5)
				elegirjoc=1
				./KitDeDesarrollo.sh
			;;

			6)
				elegirjoc=1
				./tabla.sh $nom
			;;

			7)
				elegirjoc=1
			;;
	
			8)
				elegirjoc=1
				./RPG/RPG.sh $nom
			;;

			coljo) #Easter Egg salvatge
				elegirjoc=1
				./../../Baixades/factorio/bin/x64/factorio
			;;
			
			*)
				echo "Opció incorrecta"
			;;
		
	esac

done