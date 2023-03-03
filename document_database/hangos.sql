CREATE DATABASE hangos
CHARACTER SET utf8
COLLATE utf8_hungarian_ci;

CREATE TABLE hangos.films (
  id int(11) NOT NULL,
  title varchar(255) DEFAULT NULL,
  production int(11) DEFAULT NULL,
  length int(11) DEFAULT NULL,
  presentation date DEFAULT NULL,
  youtube tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 181,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

CREATE TABLE hangos.tasks (
  id int(11) NOT NULL,
  filmid int(11) NOT NULL,
  personid int(11) NOT NULL,
  denomination varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 50,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

ALTER TABLE hangos.tasks
ADD CONSTRAINT FK_tasks_films_id FOREIGN KEY (filmid)
REFERENCES hangos.films (id);

ALTER TABLE hangos.tasks
ADD CONSTRAINT FK_tasks_persons_id FOREIGN KEY (personid)
REFERENCES hangos.persons (id);

CREATE TABLE hangos.persons (
  id int(11) NOT NULL,
  name varchar(255) DEFAULT NULL,
  gender varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 107,
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


# kép válogatáshoz
SELECT DISTINCT p.name NEVEK, t.denomination BEOSZTAS, p.gender NEME FROM tasks t
INNER JOIN persons p ON p.id = t.personid
WHERE p.id = t.personid;


# LEKÉRDEZÜK AZ ADATOKAT || LEÍRÁS

# get films || get http://localhost:3000/films
  select * from films;

# get films || get http://localhost:3000/tasks
  select * from tasks;

# get films || get http://localhost:3000/persons
  select * from persons;






