 #!/bin/bash
 # Author : LEOxian 
 # License: GPLv2
 # Description: Tic Tac Toe Game
 # Date : 23-March-2013
  
trap 'echo -e "\033[00;30m \n\nGracias por jugar \n"; exit 127' SIGINT
COLOR_RED='\033[01;31m'
COLOR_GREEN='\033[01;32m'
COLOR_BLACK='\033[00;30m'
COLOR_BLACK_BOLD='\033[01;30m'
DEFAULT_COL='\033[01;30m'
   
array=( "" "" "" "" "" "" "" "" "")
    
    win_msg () {
    echo -e "${COLOR_GREEN}Felicidades $USER_NO tu Ganas!!${COLOR_BLACK}\n"
    break ;
    }
     
     winning_rules () {
      if [ $CELL_VALUE == "${array[0]}" ] && [ $CELL_VALUE == "${array[1]}" ] && [ $CELL_VALUE == "${array[2]}" ] ; then
      win_msg
      elif [ $CELL_VALUE == "${array[3]}" ] && [ $CELL_VALUE == "${array[4]}" ] && [ $CELL_VALUE == "${array[5]}" ] ; then
      win_msg
      elif [ $CELL_VALUE == "${array[6]}" ] && [ $CELL_VALUE == "${array[7]}" ] && [ $CELL_VALUE == "${array[8]}" ] ; then
      win_msg
      elif [ $CELL_VALUE == "${array[0]}" ] && [ $CELL_VALUE == "${array[3]}" ] && [ $CELL_VALUE == "${array[6]}" ] ; then
      win_msg;
      elif [ $CELL_VALUE == "${array[1]}" ] && [ $CELL_VALUE == "${array[4]}" ] && [ $CELL_VALUE == "${array[7]}" ] ; then
      win_msg
      elif [ $CELL_VALUE == "${array[2]}" ] && [ $CELL_VALUE == "${array[5]}" ] && [ $CELL_VALUE == "${array[8]}" ] ; then
      win_msg
      elif [ $CELL_VALUE == "${array[0]}" ] && [ $CELL_VALUE == "${array[4]}" ] && [ $CELL_VALUE == "${array[8]}" ] ; then
      win_msg
      elif [ $CELL_VALUE == "${array[2]}" ] && [ $CELL_VALUE == "${array[4]}" ] && [ $CELL_VALUE == "${array[6]}" ] ; then
      win_msg
      fi
     }
       
  tie ()  {
   for k in `seq 0 $( expr ${#array[@]} - 1) `
    do
     if [ ! -z ${array[$k]} ] ; then
      tic_array[$k]=$k
       if [ "9"  -eq ${#tic_array[@]} ] ; then
        echo -e "${COLOR_GREEN}\nTal vez tengas mejor suerte !!${COLOR_BLACK}\n"
        exit
       fi 
     fi
    done
  }
        
  tic_board () {
   clear
   echo -e "\t${COLOR_BLACK_BOLD}*************************"
   echo -e "\t*\t ${array[0]:-0} | ${array[1]:-1} | ${array[2]:-2}\t*"
   echo -e "\t*\t____________\t*"
   echo -e "\t*\t ${array[3]:-3} | ${array[4]:-4} | ${array[5]:-5}\t*"
   echo -e "\t*\t____________\t*"
   echo -e "\t*\t ${array[6]:-6} | ${array[7]:-7} | ${array[8]:-8}\t*"
   echo -e "\t*************************\n${COLOR_BLACK}"
  }
         
  EMPTY_CELL () {
   echo -e -n "${DEFAULT_COL}"
   read -e -p "$MSG" col
   case "$col" in
    [0-8]) if [  -z ${array[$col]}   ]; then
    CELL_IS=empty
   else 
    CELL_IS=notempty 
   fi;;
     *)  DEFAULT_COL=$COLOR_RED
     MSG="$USER_NO Escribe un número entre 0 a 8 : "
     EMPTY_CELL;;
   esac
   echo -e -n "${COLOR_BLACK}"
  }
          
           
  CHOISE () { 
   EMPTY_CELL
   if [ "$CELL_IS" == "empty" ]; then
    array[$col]="$CELL_VALUE"
   else  
    DEFAULT_COL=${COLOR_RED}
    MSG="La caja no puede estar vacía, Re-Enter $USER_NO : "
    CHOISE 
   fi
  }
            
   PLAYER_NAME () {
   if [ -z $USER1 ]; then
    read -e -p "Introduce el nombre del primer jugador: " USER1
   fi
   
   if [ -z $USER2 ]; then
    read -e -p "Introduce el nombre del segundo jugador: " USER2
   fi
     
   if [ -z $USER1 ] ; then 
     echo -e "${COLOR_RED}El nombre del jugandor no puede estar vacío" 
     PLAYER_NAME
   elif [ -z $USER2 ]; then
     echo -e "${COLOR_RED}El nombre del jugandor no puede estar vacío" 
     PLAYER_NAME
   fi
   }
     
# Main Program
tic_board
echo -e "${DEFAULT_COL}Bienvenido al juego Tic Tac toe"
echo -e "La reglas son, introducir un número en la caja entre 0 a 8"
read -n 1 -p "Para continuar escribe y : " y
echo -e "\n"
sleep 1
     
    if  [ "$y" == "y" ]  ||  [ "$y" == "Y" ]; then
     clear
     echo -e "${COLOR_BLACK_BOLD}"
     PLAYER_NAME
    else
     echo -e "\nGracias por usarlo !!"
     exit 
    fi
                
 tic_board
  while :
   do
    ((i++))
    value=`expr $i % 2`
    if  [ "$value" == "0" ]; then
     USER_NO=$USER1
     MSG="$USER_NO Introduce tu elección : "
     CELL_VALUE="X"
     CHOISE 
    else 
     USER_NO=$USER2
     MSG="$USER_NO Introduce tu elección : "
     CELL_VALUE="O"
     CHOISE 
   fi
 
    tic_board
    winning_rules
    tie 
  done
