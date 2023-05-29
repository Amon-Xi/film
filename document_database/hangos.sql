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
DELETE FROM films;
LOAD DATA INFILE  './hangos/film.txt' INTO TABLE films;

DELETE FROM persons;
LOAD DATA INFILE  './hangos/szemely.txt' INTO TABLE persons;

DELETE FROM tasks;
LOAD DATA INFILE  './hangos/feladat.txt' INTO TABLE tasks;


select id, title,  production, length, DATE_FORMAT(presentation, '%Y.%m.%d') presentation from films;

select* from tasks
  where filmid = 3; 

SELECT * FROM films ;
SELECT * FROM tasks ;
SELECT * FROM persons ;
select * from users;


  select * from tasks
    where filmid = 5;

INSERT users 
  (id, email, password)
  VALUES
  (1,'jozsi@gmail.com','jozsijelszo'),(2,'bela@gmail.com','belajelszo'),(3,'feri@gmail.com','ferijelszo');


# szinészek és filmeik

# filmsForModal
select  DISTINCT p.name Name, p.gender Gender, t.denomination Denomination, f.title Title  from tasks t
  inner join persons p on t.personid = p.id
  inner join films f on t.filmid = f.id
where  t.personid = p.id && t.filmid = f.id
  ;

  # filmOfTaskForModal
select p.id,  p.name Name, p.gender Gender, t.denomination Denomination from tasks t
  inner join persons p on t.personid = p.id
where t.filmid = 6
  ;

#personsForTable
  select name Name, t.denomination Denomination from tasks t
  inner join persons p on t.personid = p.id
  inner join films f on t.filmid = f.id
  where  t.personid = p.id && t.filmid = f.id

;
#Szűrés
   SELECT id,title,production,length,presentation,youtube
FROM films
WHERE (title like ? )
ORDER BY title;


#Szűrés personok
   SELECT id, name, gender
FROM persons
WHERE (name like ? )
ORDER BY name;

  

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
    (title, production, length, presentation, youtube, links, embedding)
    VALUES
    ('Elmentem a vásárba', 1555, 50, '1555.02.02', 0, 'links', 'embedding');

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
select * from films;
### put films
    UPDATE films SET
    title= 'ANYÁD',
  production= 123123,
  length= 34,
  presentation= '1113.04.03.',
  youtube= 0,
  links= 'LALALLA',
  embedding= 'LALALLAAALLA'
    WHERE id = 620;

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



 select   p.name Name, p.gender Gender, t.denomination Denomination  from tasks t
      inner join persons p on t.personid = p.id
      where t.filmid = 4;

SELECT * FROM films
    WHERE id = 3;



delete from persons
  where name = '';




