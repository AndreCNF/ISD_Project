SET FOREIGN_KEY_CHECKS = 0; /*para não ter de apagar as tabelas na ordeminversa da escrita*/
drop table if exists person;
drop table if exists phone_number;
drop table if exists client;
drop table if exists veterinary;
drop table if exists assistant;
drop table if exists species;
drop table if exists generalization_species;
drop table if exists animal;
drop table if exists consult; 
drop table if exists participation;
drop table if exists diagnosis_code;
drop table if exists consult_diagnosis;
drop table if exists medication;
drop table if exists prescription;
drop table if exists indicator;
drop table if exists _procedure;
drop table if exists performed;
drop table if exists radiography;
drop table if exists test_procedure;
drop table if exists produced_indicator;
SET FOREIGN_KEY_CHECKS = 1;

create table person(
	VAT integer,
	name char(100) not null,
	address_street char(100) not null,
	address_city char(50) not null,
	address_zip char(15) not null,
	primary key(VAT)
);

/*METER CONSTRAINT*/
create table phone_number(
	VAT integer,
	phone integer,
	primary key(VAT, phone),
	foreign key(VAT) references person(VAT)
);

create table client(
	VAT integer,
	primary key(VAT),
	foreign key(VAT) references person(VAT) on delete cascade on update cascade
);

create table veterinary(
	VAT integer,
	specialization char(50) not null,
	bio text not null,
	primary key(VAT),
	foreign key(VAT) references person(VAT) on delete cascade on update cascade
);

create table assistant(
	VAT integer,
	primary key(VAT),
	foreign key(VAT) references person(VAT) on delete cascade on update cascade
);

create table species(
	name char(50),
	desc_ text not null,
	primary key(name)
);

create table generalization_species(
	name1 char(50),
	name2 char(50) not null,
	primary key(name1),
	foreign key(name1) references species(name) on delete cascade on update cascade,
	foreign key(name2) references species(name) on delete cascade on update cascade
);

create table animal(
	name char(50),
	VAT integer,
	species_name char(50) not null, 
	colour char(20) not null,
	gender char(20) not null,
	birth_year year,
	age integer,
	primary key(name,VAT),
	foreign key(VAT) references client(VAT) on delete cascade on update cascade,
	foreign key(species_name) references species(name) on delete cascade on update cascade
);

create table consult(
	name char(50),
	VAT_owner integer,
	date_timestamp timestamp,
	s text,
	o text,
	a text,
	p text,
	VAT_client integer not null, 
	VAT_vet integer not null,
	weight numeric(5,2) not null,
	primary key(name,VAT_owner,date_timestamp),
	foreign key(name,VAT_owner) references animal(name,VAT) on delete cascade on update cascade,
	foreign key(VAT_client) references client(VAT) on delete cascade on update cascade,
	foreign key(VAT_vet) references veterinary(VAT) on delete cascade on update cascade
);

create table participation(
	name char(50),
	VAT_owner integer,
	date_timestamp timestamp,
	VAT_assistant integer,
	primary key(name,VAT_owner,date_timestamp,VAT_assistant),
	foreign key(name,VAT_owner,date_timestamp) references consult(name,VAT_owner,date_timestamp) on delete cascade on update cascade,
	foreign key(VAT_assistant) references assistant(VAT) on delete cascade on update cascade
);

create table diagnosis_code(
	code char(20),
	name char(100),
	primary key (code)
);

create table consult_diagnosis(
	code char(20),
	name char(50),
	VAT_owner integer,
	date_timestamp timestamp,
	primary key(code,name,VAT_owner,date_timestamp),
	foreign key(code) references diagnosis_code(code) on delete cascade on update cascade,
	foreign key(name,VAT_owner,date_timestamp) references consult(name,VAT_owner,date_timestamp) on delete cascade on update cascade	
);

create table medication(
    name char(20),
    lab char(20),
    dosage char(100),
    primary key(name, lab, dosage)
);

create table prescription(
    code char(20),
    name char(50),
    VAT_owner integer,
    date_timestamp timestamp,
    name_med char(20) not null,
    lab char(20) not null,
    dosage char(100) not null,
    regime char(100) not null,
    primary key(code, name, VAT_owner, date_timestamp, name_med, lab, dosage),
    foreign key(code, name, VAT_owner, date_timestamp) references consult_diagnosis(code,name,VAT_owner,date_timestamp) on delete cascade on update cascade,
    foreign key(name_med,lab,dosage) references medication(name, lab, dosage) on delete cascade on update cascade
);

create table indicator(
    name char(30),
    reference_value numeric(5, 2) not null,
    units char(20) not null,
    description text not null,
    primary key(name)
);

create table _procedure(
    name char(50),
	VAT_owner integer,
	date_timestamp timestamp,
	num integer,
	description text not null,
	primary key(name, VAT_owner, date_timestamp, num),
	foreign key(name, VAT_owner, date_timestamp) references consult(name,VAT_owner,date_timestamp) on delete cascade on update cascade
);

create table performed(
    name char(50),
	VAT_owner integer,
	date_timestamp timestamp,
	num integer,
	VAT_assistant integer,
	primary key(name, VAT_owner, date_timestamp, num, VAT_assistant),
	foreign key(name, VAT_owner, date_timestamp, num) references _procedure(name,VAT_owner,date_timestamp,num) on delete cascade on update cascade,
	foreign key(VAT_assistant) references assistant(VAT) on delete cascade on update cascade
);

create table radiography(
    name char(50),
    VAT_owner integer,
    date_timestamp timestamp,
    num integer,
    file char(100) not null,
    primary key(name,VAT_owner,date_timestamp,num),
    foreign key (name,VAT_owner,date_timestamp,num) references _procedure(name, VAT_owner, date_timestamp, num) on delete cascade on update cascade
);

create table test_procedure(
    name char(50),
    VAT_owner integer,
    date_timestamp timestamp,
    num integer,
    type char(5) not null,
    CONSTRAINT type_RI CHECK(type='blood' OR type='urine'),
    primary key(name,VAT_owner,date_timestamp,num),
    foreign key (name,VAT_owner,date_timestamp,num) references _procedure(name, VAT_owner, date_timestamp, num) on delete cascade on update cascade
);

create table produced_indicator(
    name char(50),
    VAT_owner integer,
    date_timestamp timestamp,
    num integer,
    indicator_name char(20),
    value numeric(5, 2) not null,
    primary key(name,VAT_owner,date_timestamp,num, indicator_name),
    foreign key (name,VAT_owner,date_timestamp,num) references test_procedure(name, VAT_owner, date_timestamp, num) on delete cascade on update cascade
);