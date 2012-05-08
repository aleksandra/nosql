## TECHNOLOGIE NOSQL


1. Dane
	* top250movies.json
	* Lista 250 najlepszych filmów  według imdb. 
	* Dane w formacie .json.
	* Jeden obiekt na jedną linię.
	* Dane zawierają następujące pola:
		* Title
		* Year
		* Rated
		* Released
		* Genre
		* Director
		* Writer
		* Actors
		* Plot
		* Poster
		* Runtime
		* Rating
		* Votes
		* ID

2. import_to_mongo.sh
	* Skrypt zapisuje dane z pliku top250movies.json do podanej bazy danych i podanej kolekcji
	* Użycie: `import_to_mongo.sh nazwa_bazy nazwa_kolekcji`
	* np.	  `import_to_mongo.sh test filmy`
	
3. mongo_to_elastic.sh
	* Skrypt exportuje dane z mongoDB z podanej bazy i kolekcji i zapisuje w Elasticsearch
	* Użycie: `mongo_to_elastic.sh nazwa_bazy_mongo nazwa_kolekcji_mongo nazwa_indexu_elastic nazwa_typu_elastic`
	* np. 	  `mongo_to_elastic.sh test filmy test filmy`
	
4. MapReduce
	* YearAgregation.js 
		* wylicza ile filmów z każdego roku trafiło do rankingu, odpowiedź zapisuje w odp
		* wywołanie: `mongo YearAgregation.js --shell`, następnie `db.odp.find().sort({value: -1})`
	* CenturyAgregation.js
		* sprawdza, czy więcej dobrych filmów powstało w wieku XX czu już w XXI, odpowiedź zapisuje w odp
		* wywołanie: `mongo CenturyAgregation.js --shell`, następnie `db.odp.find()`
	* AverageRuntime.js
		* wylicza średni czas trwania filmów w rankingu, odpowiedź zapisuje w odp
		* wywołanie: `mongo AverageRuntime.js --shell`, następnie `db.odp.find()`
	
