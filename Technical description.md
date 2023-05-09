# Adatbázis

## Import
Az importálás folyamata

1. Eltávolítottam a fejlécet úgy hogy a `.txt` fájlokból kitörlöm az első sort.
2. Beolvastam az adatokat a fájlokból. Ha nem kell kovertálni, vagy más funkciók ahhoz hogy az adatok helyesen beketüljenek a táblába akkor ez a legrövidebb és legjobb megoldás.
3. `C:\xampp\mysql\data\hangos` Ide kell elhelyezni a kapott fájlt és ezzel a paranccsal belehet olvasni a fájlokat a kívánt táblákba.
```sql
delete from films;
LOAD DATA INFILE  './hangos/film.txt' INTO TABLE films;
delete from tasks;
LOAD DATA INFILE  './hangos/feladat.txt' INTO TABLE tasks;
delete from persons;
LOAD DATA INFILE  './hangos/szemely.txt' INTO TABLE persons;
```
 



