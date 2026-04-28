#!/bin/bash

if [ "$1" == "" ];
then
	echo "Favor colocar a URL"
	echo "Exemplo: $0 google.com"
else
	wget -nv -O /tmp/$1.http.html $1 
	echo "#####################################"
	echo "->        Buscando Hosts . . .     <-"
	echo "#####################################"

	cat /tmp/$1.http.html | grep href | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<li" > /tmp/$1.url.txt
for url in  $( cat /tmp/$1.url.txt )
do
	echo "$url"
	host $url | grep -v "NXDOMAIN"  >>  /tmp/$1.host.txt
done
	echo "####################################"
	echo "->       Resolvendo hosts . . .   <-"
	echo "####################################"
	paste -d ' has adress ' /tmp/$1.url.txt /tmp/$1.host.txt
	echo "" > /tmp/$1.host.txt

fi
