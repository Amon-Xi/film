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



ALTER TABLE users 
  ADD UNIQUE INDEX UK_users_email(email);

ALTER TABLE users 
  ADD UNIQUE INDEX UK_users_userName(userName);


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


INSERT users 
  (id, email, password)
  VALUES
  (1,'jozsi@gmail.com','jozsijelszo'),(2,'bela@gmail.com','belajelszo'),(3,'feri@gmail.com','ferijelszo');




#  LEÍRÁS

# ----- get -------
### get films 
  select * from films;

### get tasks
  select * from tasks;

### get persons
  select * from persons;

#---- get by id -------


 ### get by id films
    SELECT * FROM films
    WHERE id = 420;

 ### get by id tasks

    SELECT * FROM tasks
    WHERE id = 69;


### get by id persons
    SELECT * FROM persons
    WHERE id = 151;

#------- delete -------

### delete films
    DELETE FROM films
    WHERE id = 2;

### delete tasks
    DELETE FROM tasks
    WHERE id = 2;

### delete persons
    DELETE FROM persons
    WHERE id = 2;


#--------- post -----------

### post films
    INSERT films 
    (title, production, length, presentation, youtube)
    VALUES
    (?, ?, ?, ?, ?);

### post tasks
    INSERT tasks 
    (filmid, personid, denomination)
    VALUES
    (?, ?, ?);

### post persons
    INSERT persons 
    (name, gender)
    VALUES
    (?, ?);



#------ put --------

### put films
    UPDATE films SET
    title = ?,
    production = ?,
    length = ?,
    presentation = ?,
    youtube = ?
    WHERE id = ?;

### put tasks
    UPDATE tasks SET
    filmid = ?,
    personid = ?,
    denomination = ?
    WHERE id = ?;

### put persons
    UPDATE persons  SET
    name = ?,
    gender = ?
    WHERE id = ?;



### --------------------- USEREK -------------------------











