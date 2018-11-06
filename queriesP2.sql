
/*1*/
select animal.name, person.name, species.name, age
from animal
inner join client on animal.VAT = client.VAT
inner join person on client.VAT = person.VAT
where animal.name in
(select consult.name 
from veterinary
inner join person on veterinary.VAT = person.VAT
inner join consult on veterinary.VAT = consult.VAT_vet
where person.name = "John Smith")

/*2*/
select name, reference_value
from indicator
where units = "milligrams"
and reference_value > 100
order by reference_value desc

/*3*/
select consult.name, person.name, animal.species_name, age
from consult
inner join animal on consult.name = animal.name
inner join client on animal.VAT = client.VAT
inner join person on client.VAT = person.VAT
where o like '%obesity%' or '%obese%'
and consult.name in
(select consult.name
from consult
group by consult.name, consult.VAT_owner
having weight > 30
and date_timestamp = max(date_timestamp))

/*4*/
select person.name, client.VAT, person.address_street, person.address_city, person.address_zip
from person
where person.VAT not in 
(select client.VAT 
from client
inner join animal on animal.VAT = client.VAT)

/*5*/
select diagnosis_code.name, count(distinct medication.name)
from diagnosis_code
inner join consult_diagnosis on diagnosis_code.code = consult_diagnosis.code
inner join prescription on consult_diagnosis.name = prescription.name 
and consult_diagnosis.VAT_owner = prescription.VAT_owner 
and consult_diagnosis.date_timestamp = prescription.date_timestamp
inner join medication on prescription.name_med = medication.name
and prescription.lab = medication.lab
and prescription.dosage = medication.dosage
group by diagnosis_code.code

/*6*/
select avg(count_assistants), avg(count_procedures), avg(count_diagnosis_code), avg(count_prescriptions)
from (select count(participation.VAT_assistant), count(_procedure.num), count(diagnosis_code.code), count(prescription.name)
	from consult 
	inner join participation on consult.name = participation.name
	and consult.VAT_owner = participation.VAT_owner
	and consult.date_timestamp = participation.date_timestamp
	inner join _procedure on consult.name = _procedure.name
	and consult.VAT_owner = _procedure.VAT_owner
	and consult.date_timestamp = _procedure.date_timestamp
	inner join diagnosis_code on consult.name = diagnosis_code.name
	and consult.VAT_owner = diagnosis_code.VAT_owner
	and consult.date_timestamp = diagnosis_code.date_timestamp
	inner join prescription on diagnosis_code.code = prescription.code	
	where extract (year from consult.date_timestamp) >= 2017
	group by consult.name, consult.VAT_owner, consult.date_timestamp))
		as consult_avg(count_assistants, count_procedures, count_diagnosis_code, count_prescriptions)
		
/*7 ver outra vez por causa das sub-species*/
select animal_name, code
from (select consult.name, diagnosis_code.name, count(diagnosis_code.code)
	from consult
	inner join consult_diagnosis on consult.name = consult_diagnosis.name
	and consult.VAT_owner = consult_diagnosis.VAT_owner
	and consult.date_timestamp = consult_diagnosis.date_timestamp
	inner join diagnosis_code on consult_diagnosis.code = diagnosis_code.code
	where consult.name in
		(select animal.name 
		from species
		inner join generalization_species on species.name = generalization_species.name1
		inner join animal on species.name = animal.species_name
		where species.name = "dog")
	group by consult.name, diagnosis_code.name)
		as count_diseases(animal_name, code, count_occurencies)
group by animal_name, code
having count_occurencies = max(count_occurencies)

/*8*/
select person.name
from ((select animal.VAT
	from animal
	inner join client on animal.VAT = client.VAT)
	union
	(select consult.VAT_owner
	from consult
	inner join client on consult.VAT_owner = client.VAT))
	where animal.VAT in(
		(select veterinary.VAT
		from veterinary)
		union
		(select assistant.VAT
		from assistant))
inner join person on person.VAT = animal.VAT

/*9*/
select person.name, person.address_street, person.address_city, person.address_zip
from animal
where animal.VAT not in(
	select animal.VAT
	from animal
	group by animal.VAT
	where species_name not like "%bird%")
inner join client on animal.VAT = client.VAT
inner join person on client.VAT = person.VAT
