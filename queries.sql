/*1*/
select C.name as Animal_Name, O.name as Owner_Name, A.species_name as Animal_Species, year(current_date)-birth_year as Animal_Age 
from consult as C ,animal as A,client natural join person as O
where C.VAT_owner = A.VAT
and C.name = A.name
and O.VAT = C.VAT_owner
and VAT_vet in (
	select VAT
	from veterinary natural join person
	where name = 'John Smith'
);

/*2*/
select name, reference_value
from indicator
where units = 'miligrams'
group by reference_value
having reference_value > 100
order by reference_value desc;

/*3*/
select consult.name as Animal_Name, person.name as Owner_Name, animal.species_name as Animal_Species, year(current_date)-birth_year as Animal_Age
from consult
inner join animal on consult.name = animal.name
inner join client on animal.VAT = client.VAT
inner join person on client.VAT = person.VAT
where o like '%obesity%' or o like '%obese%'
and weight > 30
and (consult.name, VAT_owner, date_timestamp) in
(select consult.name, VAT_owner,max(date_timestamp)
from consult
group by consult.name,consult.VAT_owner);

/*4*/
select name as Client_Name, VAT as Client_VAT, concat(address_street,', ',address_zip,' - ',address_city) as Client_Address
from person
where VAT in(
	select VAT
	from client
	where VAT not in(
	select VAT
	from animal));
	
/*5*/