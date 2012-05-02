#!/bin/bash
#skrypt zapisuje w bazie mongoDB dane z pliku top250movies.json


echo
if [ "$#" -ne 2 ]
	then
		echo "Skrypt zapisuje w podanej bazie ipodanej kolekcji dane z pliku top250movies.json" 
		echo "Użycie: import_to_mongo.sh nazwa_bazy nazwa_kolekcji"
		echo
	elif [ ! -f top250movies.json ] 
	then
		echo "Nie znaleziono pliku top250movies.json"
	else
		echo "Importowanie pliku top250movies.json do bazy $1 do kolekcji $2 ..."
		mongoimport --file top250movies.json --db $1 --collection $2
		echo "Ukończono."
fi
