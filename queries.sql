/*1*/
select C.name as 'Animal Name', O.name as 'Owner Name', A.species_name as 'Animal Species', year(current_date)-birth_year as 'Animal Age' 
from consult as C ,animal as A,client natural join person as O
where C.VAT_owner = A.VAT
and C.name = A.name
and O.VAT = C.VAT_owner
and VAT_vet in (
	select VAT
	from veterinary natural join person
	where name = 'John Smith'
)
group by C.name,C.VAT_owner;

/*2*/
select name, reference_value
from indicator
where units = 'miligrams'
group by reference_value
having reference_value > 100
order by reference_value desc;

/*3*/
select consult.name as 'Animal Name', person.name as 'Owner Name', animal.species_name as 'Animal Species', year(current_date)-birth_year as 'Animal Age'
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
select name as 'Client Name', VAT as 'Client VAT', concat(address_street,', ',address_zip,' - ',address_city) as 'Client Address'
from person
where VAT in(
	select VAT
	from client
	where VAT not in(
	select VAT
	from animal));
	
/*5*/
select diagnosis_code.name as 'Diagnosis', count(distinct name_med) as 'Distinct Medication'
from diagnosis_code left outer join prescription using(code)
group by code
order by count(distinct name_med);

/*6***************************/
