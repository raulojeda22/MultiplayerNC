echo -n "Input IP: "

read IP

nc $IP 33026 > Port.txt

port=`cat Port.txt`

nc $IP $port