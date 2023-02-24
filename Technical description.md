# Adatbázis

## Import
Az importálás folyamata

1. Eltávolítottam a fejlécet.
2. Beolvastam az adatokat a fájlokból.
```sql
delete from films;
LOAD DATA INFILE  './hangos/film.txt' INTO TABLE films;
delete from tasks;
LOAD DATA INFILE  './hangos/feladat.txt' INTO TABLE tasks;
delete from persons;
LOAD DATA INFILE  './hangos/szemely.txt' INTO TABLE persons;
```



