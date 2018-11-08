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

/*4.*/
insert into diagnosis_code
values ('01008','end-stage renal disease')

update diagnostic_code
set diagnosis_code.code = '01008' , diagnosis_code.name = 'end-stage renal disease'
from test_procedure as tp, produced_indicator as pri
where tp.name = pri.name
and tp.VAT_owner = pri.VAT_owner
and tp.date_timestamp = pri.date_timestamp
and tp.num = pri.num
and tp.type = 'blood' 
and pri.indicator_name = 'creatinine level'
and pri.value > 1.0
