SET FOREIGN_KEY_CHECKS = 0; /*para não ter de apagar as tabelas na ordem inversa da escrita*/
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS phone_number;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS veterinary;
DROP TABLE IF EXISTS assistant;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS generalization_species;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS consult; 
DROP TABLE IF EXISTS participation;
DROP TABLE IF EXISTS diagnosis_code;
DROP TABLE IF EXISTS consult_diagnosis;
DROP TABLE IF EXISTS medication;
DROP TABLE IF EXISTS prescription;
DROP TABLE IF EXISTS indicator;
DROP TABLE IF EXISTS _procedure;
DROP TABLE IF EXISTS performed;
DROP TABLE IF EXISTS radiography;
DROP TABLE IF EXISTS test_procedure;
DROP TABLE IF EXISTS produced_indicator;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE person(
	VAT INTEGER,
	name CHAR(100) NOT NULL,
	address_street CHAR(100) NOT NULL,
	address_city CHAR(50) NOT NULL,
	address_zip CHAR(15) NOT NULL,
	PRIMARY KEY(VAT)
);

/*METER CONSTRAINT*/
CREATE TABLE phone_number(
	VAT INTEGER,
	phone CHAR(15), /*to be extensible to different kinds of phone structures*/
	PRIMARY KEY(VAT, phone),
	FOREIGN KEY(VAT) REFERENCES person(VAT) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE client(
	VAT INTEGER,
	PRIMARY KEY(VAT),
	FOREIGN KEY(VAT) REFERENCES person(VAT) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE veterinary(
	VAT INTEGER,
	specialization CHAR(50) NOT NULL,
	bio TEXT NOT NULL,
	PRIMARY KEY(VAT),
	FOREIGN KEY(VAT) REFERENCES person(VAT) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE assistant(
	VAT INTEGER,
	PRIMARY KEY(VAT),
	FOREIGN KEY(VAT) REFERENCES person(VAT) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE species(
	name CHAR(50),
	desc_ TEXT NOT NULL,
	PRIMARY KEY(name)
);

CREATE TABLE generalization_species(
	name1 CHAR(50),
	name2 CHAR(50) NOT NULL,
	PRIMARY KEY(name1),
	FOREIGN KEY(name1) REFERENCES species(name) ON DELETE CASCADE ON UPDATE cascade,
	FOREIGN KEY(name2) REFERENCES species(name) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE animal(
	name CHAR(50),
	VAT INTEGER,
	species_name CHAR(50) NOT NULL, 
	colour CHAR(20) NOT NULL,
	gender CHAR(20) NOT NULL,
	birth_year year,
	age INTEGER,
	PRIMARY KEY(name,VAT),
	FOREIGN KEY(VAT) REFERENCES client(VAT) ON DELETE CASCADE ON UPDATE cascade,
	FOREIGN KEY(species_name) REFERENCES species(name) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE consult(
	name CHAR(50),
	VAT_owner INTEGER,
	date_timestamp TIMESTAMP,
	s TEXT,
	o TEXT,
	a TEXT,
	p TEXT,
	VAT_client INTEGER NOT NULL, 
	VAT_vet INTEGER NOT NULL,
	weight NUMERIC(5,2) NOT NULL,
	PRIMARY KEY(name,VAT_owner,date_timestamp),
	FOREIGN KEY(name,VAT_owner) REFERENCES animal(name,VAT) ON DELETE CASCADE ON UPDATE cascade,
	FOREIGN KEY(VAT_client) REFERENCES client(VAT) ON DELETE CASCADE ON UPDATE cascade,
	FOREIGN KEY(VAT_vet) REFERENCES veterinary(VAT) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE participation(
	name CHAR(50),
	VAT_owner INTEGER,
	date_timestamp TIMESTAMP,
	VAT_assistant INTEGER,
	PRIMARY KEY(name,VAT_owner,date_timestamp,VAT_assistant),
	FOREIGN KEY(name,VAT_owner,date_timestamp) REFERENCES consult(name,VAT_owner,date_timestamp) ON DELETE CASCADE ON UPDATE cascade,
	FOREIGN KEY(VAT_assistant) REFERENCES assistant(VAT) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE diagnosis_code(
	code CHAR(5), /*It was chosen a CHAR instead of integer so that the zeros before the number were also printed*/
	name CHAR(100),
	PRIMARY KEY (code)
);

CREATE TABLE consult_diagnosis(
	code CHAR(5),
	name CHAR(50),
	VAT_owner INTEGER,
	date_timestamp TIMESTAMP,
	PRIMARY KEY(code,name,VAT_owner,date_timestamp),
	FOREIGN KEY(code) REFERENCES diagnosis_code(code) ON DELETE CASCADE ON UPDATE cascade,
	FOREIGN KEY(name,VAT_owner,date_timestamp) REFERENCES consult(name,VAT_owner,date_timestamp) ON DELETE CASCADE ON UPDATE cascade	
);

CREATE TABLE medication(
    name CHAR(20),
    lab CHAR(20),
    dosage CHAR(100),
    PRIMARY KEY(name, lab, dosage)
);

CREATE TABLE prescription(
    code CHAR(5),
    name CHAR(50),
    VAT_owner INTEGER,
    date_timestamp TIMESTAMP,
    name_med CHAR(20) NOT NULL,
    lab CHAR(20) NOT NULL,
    dosage CHAR(100) NOT NULL,
    regime CHAR(100) NOT NULL,
    PRIMARY KEY(code, name, VAT_owner, date_timestamp, name_med, lab, dosage),
    FOREIGN KEY(code, name, VAT_owner, date_timestamp) REFERENCES consult_diagnosis(code,name,VAT_owner,date_timestamp) ON DELETE CASCADE ON UPDATE cascade,
    FOREIGN KEY(name_med,lab,dosage) REFERENCES medication(name, lab, dosage) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE indicator(
    name CHAR(30),
    reference_value NUMERIC(5, 2) NOT NULL, /*to allow float numbers*/
    units CHAR(20) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY(name)
);

CREATE TABLE _procedure(
    name CHAR(50),
	VAT_owner INTEGER,
	date_timestamp TIMESTAMP,
	num INTEGER,
	description TEXT NOT NULL,
	PRIMARY KEY(name, VAT_owner, date_timestamp, num),
	FOREIGN KEY(name, VAT_owner, date_timestamp) REFERENCES consult(name,VAT_owner,date_timestamp) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE performed(
    name CHAR(50),
	VAT_owner INTEGER,
	date_timestamp TIMESTAMP,
	num INTEGER,
	VAT_assistant INTEGER,
	PRIMARY KEY(name, VAT_owner, date_timestamp, num, VAT_assistant),
	FOREIGN KEY(name, VAT_owner, date_timestamp, num) REFERENCES _procedure(name,VAT_owner,date_timestamp,num) ON DELETE CASCADE ON UPDATE cascade,
	FOREIGN KEY(VAT_assistant) REFERENCES assistant(VAT) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE radiography(
    name CHAR(50),
    VAT_owner INTEGER,
    date_timestamp TIMESTAMP,
    num INTEGER,
    file CHAR(100) NOT NULL,
    PRIMARY KEY(name,VAT_owner,date_timestamp,num),
    FOREIGN KEY (name,VAT_owner,date_timestamp,num) REFERENCES _procedure(name, VAT_owner, date_timestamp, num) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE test_procedure(
    name CHAR(50),
    VAT_owner INTEGER,
    date_timestamp TIMESTAMP,
    num INTEGER,
    type CHAR(5) NOT NULL,
    CONSTRAINT type_RI CHECK(type='blood' OR type='urine'),
    PRIMARY KEY(name,VAT_owner,date_timestamp,num),
    FOREIGN KEY (name,VAT_owner,date_timestamp,num) REFERENCES _procedure(name, VAT_owner, date_timestamp, num) ON DELETE CASCADE ON UPDATE cascade
);

CREATE TABLE produced_indicator(
    name CHAR(50),
    VAT_owner INTEGER,
    date_timestamp TIMESTAMP,
    num INTEGER,
    indicator_name CHAR(30),
    value NUMERIC(5, 2) NOT NULL,
    PRIMARY KEY(name,VAT_owner,date_timestamp,num, indicator_name),
    FOREIGN KEY (name,VAT_owner,date_timestamp,num) REFERENCES test_procedure(name, VAT_owner, date_timestamp, num) ON DELETE CASCADE ON UPDATE cascade
);