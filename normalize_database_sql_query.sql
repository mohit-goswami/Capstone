-- Apply appropriate normalization techniques (upto 3 NF) to divide it into multiple tables --

-- craetion of new database olympic from csv file -- 

CREATE DATABASE olympic;


-- insert table with help of pymysql and alchemy library --

-- country table contain unqiue country name and id in daatset --

create table Country (
country_id int Not Null auto_increment,
countary_name varchar(500),
PRIMARY KEY (country_id) 
);

-- insert value from master olympic table --
INSERT INTO Country(countary_name) select distinct(country) from olympic;

-- Personal table contain unqiue personal name and id in daatset , not age because it varies in each olympic --

create table Personal (
personal_id int Not Null auto_increment,
personal_name varchar(500),
PRIMARY KEY (personal_id) 
);

-- insert value from master olympic table --

INSERT INTO Personal(personal_name) select distinct(name) from olympic;

-- sports table contain unqiue sports name and id in daatset --
create table Sports (
sport_id int Not Null auto_increment,
sport_name varchar(500),
PRIMARY KEY (sport_id) 
);

-- insert value from master olympic table --

INSERT INTO Sports(sport_name) select distinct(sports) from olympic;


 -- normalization of database --
/*
 creation of whole olympic database which going to contain uniques id of table we craete already  with help of various joins 
 after createtion of link table we going to delete both master and this table with drop function.
*/

-- merging all table --
create table whole_olympic AS 
SELECT * FROM olympic join country on olympic.country=country.countary_name  join sports on olympic.`sports`=`sports`.`sport_name`join personal on olympic.name=personal.`personal_name`;

-- creation of medal_olympic table which going to contain year ,date of event, age, pesonal and sports id and respective medal tally --

create table medal_olympic AS
select year,personal_id,age,sport_id,Date_Given,gold_medal,silver_medal,brone_medal,total_medal from whole_olympic;

-- personal_country_link this table going to link personal with respected country --

create table personal_country_link AS
select personal_id,country_id from whole_olympic;

-- droping rest of TABLE  --
drop table whole_olympic;
drop table olympic;