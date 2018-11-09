/*1.*/
UPDATE person, client
SET address_street = 'Rua Giroflé, nº4', address_city = 'Leiria'
WHERE person.VAT = client.VAT
AND name = 'John Smith';

/*teste*/
SELECT *
FROM person, client
WHERE person.VAT = client.VAT
AND name = 'John Smith';

/*2.*/
UPDATE indicator AS i, test_procedure AS tp, produced_indicator AS pri
SET reference_value = reference_value*1.1
WHERE type = 'blood'
AND units = 'milligrams'
AND pri.indicator_name = i.name
AND tp.name = pri.name
AND tp.VAT_owner = pri.VAT_owner
AND tp.date_timestamp = pri.date_timestamp
AND tp.num = pri.num;

/*Teste*/
Select reference_value
FROM indicator as i, test_procedure as tp, produced_indicator as pri
WHERE type = 'blood'
AND units = 'milligrams'
AND pri.indicator_name = i.name
AND tp.name = pri.name
AND tp.VAT_owner = pri.VAT_owner
AND tp.date_timestamp = pri.date_timestamp
AND tp.num = pri.num;

/*3.*/
delete FROM person
WHERE name = 'John Smith'
AND person.VAT IN (
	SELECT client.VAT
	FROM client);

/*Teste*/
SELECT name FROM person WHERE name='John Smith';
SELECT animal.VAT FROM animal INNER JOIN person USING(VAT) WHERE person.name = 'John Smith';
SELECT VAT_owner FROM consult INNER JOIN person ON VAT_owner = VAT WHERE person.name = 'John Smith';
SELECT VAT_owner FROM consult INNER JOIN person ON VAT_client = VAT WHERE person.name = 'John Smith';

/*4.*/
INSERT INTO diagnosis_code
VALUES ('01008','end-stage renal disease');

UPDATE consult_diagnosis AS cd, diagnosis_code AS dc
SET cd.code = '01008'
WHERE dc.name = 'kidney failure'
AND dc.code = cd.code
AND (cd.name, cd.VAT_owner, cd.date_timestamp) IN (
	SELECT name, VAT_owner, date_timestamp
	FROM  test_procedure NATURAL JOIN produced_indicator
	WHERE type = 'blood' 
	AND indicator_name = 'creatinine level'
	AND value > 1.0
)

/*4. Nova tentativa bruno*/
/*INSERT INTO diagnosis_code
VALUES ('01008','end-stage renal disease');

UPDATE consult_diagnosis AS cd, diagnosis_code AS dc
SET dc.code = '01008', dc.name = 'end-stage renal disease';
WHERE dc.name = 'kidney failure'
AND cd.code = dc.code*/


/*Teste - antes e depois*/
SELECT *
FROM consult_diagnosis AS cd, diagnosis_code AS dc
WHERE dc.name = 'kidney failure'
AND cd.code = dc.code
AND (cd.name, cd.VAT_owner, cd.date_timestamp) IN(
	SELECT name, VAT_owner, date_timestamp
	FROM  test_procedure NATURAL JOIN produced_indicator
	WHERE type = 'blood' 
	AND indicator_name = 'creatinine level'
	AND value > 1.0
)
/*teste - depois*/
SELECT *
FROM consult_diagnosis AS cd, diagnosis_code AS dc
WHERE dc.name = 'end-stage renal disease'
AND cd.code = dc.code
AND (cd.name, cd.VAT_owner, cd.date_timestamp) IN(
	SELECT name, VAT_owner, date_timestamp
	FROM  test_procedure NATURAL JOIN produced_indicator
	WHERE type = 'blood' 
	AND indicator_name = 'creatinine level'
	AND value > 1.0
)