#!/bin/bash
infinit=0

echo 'Escriu "kill" per a tancar els terminals'
while [[ $infinit -eq 0 ]]; do
	read meme
	case $meme in
		"kill")
			pkill terminal
		;;
		*)
			echo "bon meme"
		;;
	esac
done