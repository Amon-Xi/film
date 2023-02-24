# Adatbázis

## Import
Az importálás folyamata

1. Eltávolítottam a fejlécet.
2. Beolvastam az adatokat a fájlokból.
```sql
delete from film;
LOAD DATA INFILE  './hangos/film.txt' INTO TABLE film;
delete from feladat;
LOAD DATA INFILE  './hangos/feladat.txt' INTO TABLE feladat;
delete from szemely;
LOAD DATA INFILE  './hangos/szemely.txt' INTO TABLE szemely;
```

