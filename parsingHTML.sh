#!/bin/bash

if [ "$1" == "" ];
then
	echo "Favor colocar a URL"
	echo "Exemplo: $0 google.com"
else
	wget -nv -O /tmp/$1.http.html $1 
	
	cat /tmp/$1.http.html | grep href | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<li" >> /tmp/$1.url.txt
for url in  $[ cat /tmp/$ip.url.txt ]
do
	echo "$url"
done
fi
