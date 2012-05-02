#!/bin/bash
# Skrypt exportuje dane z mongoDB z podanej bazy i kolekcji i zapisuje w Elasticsearch

clear
echo
if [ "$#" -ne 4 ]
  then
	echo "Skrypt exportuje dane z mongoDB z podanej bazy i kolekcji i zapisuje w Elasticsearch"
	echo "Użycie: mongo_to_elastic.sh nazwa_bazy_mongo nazwa_kolekcji_mongo nazwa_indexu_elastic nazwa_typu_elastic"
	echo
  else
	echo "Exportowanie danych z bazy $1 z kolekcji $2 ..."
	mongoexport --db $1 --collection $2 --out .tmp.json
	echo "Zapisywanie danych do bazy Elasticsearch."
	I=0
	while read; do
		I=$(($I + 1))
		curl -XPUT http://localhost:9200/$3/$4/$I -d "$REPLY"
	done < "top250movies.json"
	echo "Ukończono."
	rm .tmp.json
fi
