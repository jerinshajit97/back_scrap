#!/bin/bash

echo "[=] statring Back Scrap"

echo "[+] creating folder"
mkdir -p wayback

echo "[+] scrapping wayback machine"
echo "$1" | waybackurls | sort -u > wayback/wayback.txt


for list in $(gf --list)
	do 
		echo "[+] finding $list"
		
		if  [ $list != "urls" ] && [ $list != "strings" ] && [ $( cat wayback/wayback.txt | gf $list | sort -u | wc -c ) -gt 1 ] 
		then
			cat wayback/wayback.txt | gf $list | sort -u > wayback/$list.txt
		fi
	done

echo "[+] finding paths"
cat wayback/wayback.txt | unfurl paths | sort -u > wayback/paths.txt

echo "[+] finding keypairs"
cat wayback/wayback.txt | unfurl keypairs | sort -u > wayback/keypairs.txt

echo "[+] finding domains"
cat wayback/wayback.txt | unfurl domains | sort -u > wayback/domains.txt


echo "[=] back scrap is completed! "

echo "peace be with you"
