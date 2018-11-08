/*1.*/
update person, client
set address_street = 'Rua Giroflé, nº4', address_city = 'Leiria'
where person.VAT = client.VAT
and name = 'John Smith';

/*2.*/
update indicator as i, test_procedure as tp, produced_indicator as pri
set reference_value = reference_value*1.1
where type = 'blood'
and units = 'milligrams'
and pri.indicator_name = i.name
and tp.name = pri.name
and tp.VAT_owner = pri.VAT_owner
and tp.date_timestamp = pri.date_timestamp
and tp.num = pri.num;

/*3.*/
delete from person
where name = 'John Smith'
and person.VAT in (
	select client.VAT
	from client);

/*Teste*/
select name from person where name='John Smith';
select animal.VAT from animal inner JOIN person using(VAT) where person.name = 'John Smith';
select VAT_owner from consult inner JOIN person on VAT_owner = VAT where person.name = 'John Smith';
select VAT_owner from consult inner JOIN person on VAT_client = VAT where person.name = 'John Smith';

/*4.*/
insert into diagnosis_code
values ('01008','end-stage renal disease');

update consult_diagnosis as cd, diagnosis_code as dc
set cd.code = '01008'
where dc.name = 'kidney failure'
and dc.code = cd.code
and (cd.name, cd.VAT_owner, cd.date_timestamp) in(
	select name, VAT_owner, date_timestamp
	from  test_procedure natural join produced_indicator
	where type = 'blood' 
	and indicator_name = 'creatinine level'
	and value > 1.0
)
/*está a dar erro e pelo que percebi tem a ver com o
update timestamp on cascade*/

/*Teste - antes e depois*/
select *
from consult_diagnosis as cd, diagnosis_code as dc
where dc.name = 'kidney failure'
and cd.code = dc.code
and (cd.name, cd.VAT_owner, cd.date_timestamp) in(
	select name, VAT_owner, date_timestamp
	from  test_procedure natural join produced_indicator
	where type = 'blood' 
	and indicator_name = 'creatinine level'
	and value > 1.0
)
/*teste - depois*/
select *
from consult_diagnosis as cd, diagnosis_code as dc
where dc.name = 'end-stage renal disease'
and cd.code = dc.code
and (cd.name, cd.VAT_owner, cd.date_timestamp) in(
	select name, VAT_owner, date_timestamp
	from  test_procedure natural join produced_indicator
	where type = 'blood' 
	and indicator_name = 'creatinine level'
	and value > 1.0
)