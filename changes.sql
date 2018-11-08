/*1.*/
UPDATE person, client
SET address_street = 'Rua Giroflé, nº4', address_city = 'Leiria'
WHERE person.VAT = client.VAT
and name = 'John Smith';

/*teste*/
select *
from person, client
WHERE person.VAT = client.VAT
and name = 'John Smith';

/*2.*/
UPDATE indicator as i, test_procedure as tp, produced_indicator as pri
SET reference_value = reference_value*1.1
WHERE type = 'blood'
and units = 'milligrams'
and pri.indicator_name = i.name
and tp.name = pri.name
and tp.VAT_owner = pri.VAT_owner
and tp.date_timestamp = pri.date_timestamp
and tp.num = pri.num;

/*Teste*/
Select reference_value
from indicator as i, test_procedure as tp, produced_indicator as pri
WHERE type = 'blood'
and units = 'milligrams'
and pri.indicator_name = i.name
and tp.name = pri.name
and tp.VAT_owner = pri.VAT_owner
and tp.date_timestamp = pri.date_timestamp
and tp.num = pri.num;

/*3.*/
delete from person
WHERE name = 'John Smith'
and person.VAT in (
	select client.VAT
	from client);

/*Teste*/
select name from person WHERE name='John Smith';
select animal.VAT from animal inner JOIN person using(VAT) WHERE person.name = 'John Smith';
select VAT_owner from consult inner JOIN person on VAT_owner = VAT WHERE person.name = 'John Smith';
select VAT_owner from consult inner JOIN person on VAT_client = VAT WHERE person.name = 'John Smith';

/*4.*/
INSERT INTO diagnosis_code
VALUES ('01008','end-stage renal disease');

UPDATE consult_diagnosis AS cd, diagnosis_code AS dc
SET cd.code = '01008'
WHERE dc.name = 'kidney failure'
AND dc.code = cd.code
AND (cd.name, cd.VAT_owner, cd.date_timestamp) IN (
	SELECT name, VAT_owner, date_timestamp
	FROM  test_procedure natural join produced_indicator
	WHERE type = 'blood' 
	AND indicator_name = 'creatinine level'
	AND value > 1.0
)

/*4. Nova tentativa bruno*/
/*INSERT INTO diagnosis_code
VALUES ('01008','end-stage renal disease');

UPDATE consult_diagnosis as cd, diagnosis_code as dc
SET dc.code = '01008', dc.name = 'end-stage renal disease';
WHERE dc.name = 'kidney failure'
AND cd.code = dc.code*/


/*Teste - antes e depois*/
select *
from consult_diagnosis as cd, diagnosis_code as dc
WHERE dc.name = 'kidney failure'
and cd.code = dc.code
and (cd.name, cd.VAT_owner, cd.date_timestamp) in(
	select name, VAT_owner, date_timestamp
	from  test_procedure natural join produced_indicator
	WHERE type = 'blood' 
	and indicator_name = 'creatinine level'
	and value > 1.0
)
/*teste - depois*/
select *
from consult_diagnosis as cd, diagnosis_code as dc
WHERE dc.name = 'end-stage renal disease'
and cd.code = dc.code
and (cd.name, cd.VAT_owner, cd.date_timestamp) in(
	select name, VAT_owner, date_timestamp
	from  test_procedure natural join produced_indicator
	WHERE type = 'blood' 
	and indicator_name = 'creatinine level'
	and value > 1.0
)