/*1.*/
update person
set address_street = 'Rua Giroflé, nº4', address_city = 'Leiria'
from person, client
where person.VAT = client.VAT
where name = 'John Smith';

/*2.*/
update reference_value
set reference_value = reference_value*1.1
from test_procedure as tp, produced_indicator as pi, indicator as i
where type = 'blood'
and units = 'milligrams'
and pi.indicator_name = i.name
and tp.name = pi.name
and tp.VAT_owner = pi.VAT_owner
and tp.date_timestamp = pi.date_timestamp
and tp.num = pi.num;

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
set diagnosis_code.code = , diagnosis_code.name =
from test_procedure
where test_procedure.type 
