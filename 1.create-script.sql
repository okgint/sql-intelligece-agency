DROP TABLE IF EXISTS former_address;
DROP TABLE IF EXISTS alias;
DROP TABLE IF EXISTS relative;
DROP TABLE IF EXISTS school;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS job;
DROP TABLE IF EXISTS fingerprints;

DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS person_types;


CREATE TABLE person_types(
classification int,
classification_description varchar(15),

constraint person_types_pkey primary key(classification)
);

CREATE TABLE person(
person_id int,
classification int,
birthdate date,
local_id varchar(15),
driver_license_country varchar(15),
driver_license_state varcahr(15),
driver_license_number varchar(15),
photo BLOB,
retina_print BLOB,
height decimal (5,1),
weight decimal (5,1),
eye_color decimal(5,1),
vision char(10),
religion char(15),
street_address char(30),
city char(30),
state char(30),
country char(30),
zip_post_code char(10),
phone char(15),
first_name varchar(15),
last_name varchar(15),
recruiting_agent int,

constraint person_fkey primary key(person_id)
constraint person_fkey foreign key(classification)
	   references person_types(classification)
);

create table former_address(
person_ID INT,
date_moved_in date,
date_moved_out date,
street_address varchar(30),
city varchar(30),
state varchar(30),
country varchar(30),
zip_post_code varchar(10),

constraint former_address_pkey primary key(person_ID, date_moved_in),
constraint former_address_fkey foreign key(person_ID)
	   references former_address(person_ID)
);

create table alias(
person_ID int,
last_name varchar(15),
first_name varchar(15),
photo BLOB,
birthdate DATE,
local_id varchar(15),
driver_license_country varchar(15),
driver_license_state varchar(15),
driver_license_number varchar(15),
height DECIMAL (5,1),
weight DECIMAL (5,1),
eye_color varchar(10),
street_address varchar(30),
city varchar(30),
state varchar(30),
country varchar(30),
zip_post_code varchar(10),
phone varchar(15),
date_last_used date,

constraint alias_pkey primary key(person_ID, last_name, first_name),
constraint alias_fkey foreign key(person_ID)
	   references person(person_ID)
);

create table relative(
person_ID int,
first_name varchar(15),
last_name varchar(15),
birthdate DATE,
how_related varchar(30),
street_address varchar(30),
city varchar(30),
state varchar(30),
country varchar(30),
zip_post_code varchar(10),
phone char(15),
photo BLOB,
current_employer varchar(30),
education varchar(30),

constraint relative_pkey primary key(person_ID, first_name, last_name, birthdate),
constraint relative_fkey foreign key(person_ID)
	   refereces person(person_ID)
);

create table school(
school_ID int,
school_name varchar(50),
city varchar(30),
state varchar(30),
country varchar(30),

constraint school_pkey primary key(school_ID)
);

create table education(
person_ID int,
schoold_ID int,
date_entered DATE,
date_left DATE,
degree_earned varchar(10),
major_subject varchar(15),
minor_subject varchar(15),

constraint education_pkey primary key(person_ID, school_ID, date_entered),
constraint education_fkey1 foreign key(person_ID)
	   references person(personID),
constraint education_fkey2 foreign key(school_ID)
	   references school(school_ID)
);

create table company(
company_ID int,
company_name varchar(50),
street_address varchar(30),
city varchar(30),
state varchar(30),
zip_post_code varchar(10),
phone varchar(15),

constraint company_pkey primary key(company_ID)
);

create table job(
company_ID int,
date_started DATE,
date_left DATE,
job_title varchar(50),
person_ID INT,

constraint job_pkey primary key(company_ID, date_started),
constraint job_fkey1 foreign key(company_ID)
	   references company(company_ID),
constraint job_fkey2 foreign key(person_ID)
	   references person(person_ID)
);

create table fingerprints(
person_ID int,
finger varchar(15),
print BLOB,

constraint fingerprints_pkey primary key(person_ID, finger),
constraint fingersprints_fkey foreign key(person_ID)
	   references person(person_ID)
);

create table conviction(
person_ID int,
conviction_date DATE,
crime varchar(50),
counts int,
sentecne char(50),

constraint conviction_pkey primary key(person_ID, conviction_date, crime)
);

create table organization(
organization_ID int,
organization_name varchar(50),

