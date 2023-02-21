CREATE DATABASE hangos
CHARACTER SET utf8
COLLATE utf8_hungarian_ci;

CREATE TABLE hangos.film (
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

CREATE TABLE hangos.feladat (
  id int(11) NOT NULL,
  filmid int(11) NOT NULL,
  szemelyid int(11) NOT NULL,
  megnevezes varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

ALTER TABLE hangos.feladat
ADD CONSTRAINT FK_feladat_film_id FOREIGN KEY (filmid)
REFERENCES hangos.film (id) ON UPDATE NO ACTION;

ALTER TABLE hangos.feladat
ADD CONSTRAINT FK_feladat_szemely_id FOREIGN KEY (szemelyid)
REFERENCES hangos.szemely (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE hangos.szemely (
  id int(11) NOT NULL,
  nev varchar(255) DEFAULT NULL,
  nem varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

LOAD DATA INFILE  './hangos/film.txt' INTO TABLE film;
LOAD DATA INFILE  './hangos/feladat.txt' INTO TABLE feladat;
LOAD DATA INFILE  './hangos/szemely.txt' INTO TABLE szemely;


SELECT * FROM film ;
SELECT * FROM feladat ;
SELECT * FROM szemely ;


# TEST #
#legrégebbi gyártás
SELECT min(f.gyartas) legregebbi_gyartas FROM film f
where f.gyartas > 0
;
