CREATE DATABASE hangos
CHARACTER SET utf8
COLLATE utf8_hungarian_ci;

CREATE TABLE hangos.films (
  id int(11) NOT NULL,
  cim varchar(255) NOT NULL,
  gyartas int(11) NOT NULL,
  hossz int(11) DEFAULT NULL,
  bemutato date DEFAULT NULL,
  youtube tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

CREATE TABLE hangos.tasks (
  id int(11) NOT NULL,
  filmid int(11) NOT NULL,
  szemelyid int(11) NOT NULL,
  megnevezes varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

ALTER TABLE hangos.tasks
ADD CONSTRAINT FK_feladat_film_id FOREIGN KEY (filmid)
REFERENCES hangos.film (id) ON UPDATE NO ACTION;

ALTER TABLE hangos.tasks
ADD CONSTRAINT FK_feladat_szemely_id FOREIGN KEY (szemelyid)
REFERENCES hangos.szemely (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE hangos.persons (
  id int(11) NOT NULL,
  nev varchar(255) DEFAULT NULL,
  nem varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

# Beolvasom az adatokat a táblákba
delete from films;
LOAD DATA INFILE  './hangos/film.txt' INTO TABLE films;
delete from tasks;
LOAD DATA INFILE  './hangos/feladat.txt' INTO TABLE tasks;
delete from persons;
LOAD DATA INFILE  './hangos/szemely.txt' INTO TABLE persons;


SELECT * FROM films ;
SELECT * FROM tasks ;
SELECT * FROM persons ;
select * from users;





