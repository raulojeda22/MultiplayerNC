
rm -rf eleccio.txt
nom=$1
echo
echo "Enviat!"
echo
echo "Esperant..."
linies=`cat eleccions.txt | wc -l`

while [[ $linies -eq 1 ]]; do
	linies=`cat eleccions.txt | wc -l`
done

if [[ $linies -eq 2 ]]; then
	./continuarono.sh $nom
fi
