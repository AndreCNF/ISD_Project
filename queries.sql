/*1*/
SELECT C.name AS 'Animal Name', O.name AS 'Owner Name', A.species_name AS 'Animal Species', year(current_date)-birth_year AS 'Animal Age' 
FROM consult AS C ,animal AS A,client NATURAL JOIN person AS O
WHERE C.VAT_owner = A.VAT
AND C.name = A.name
AND O.VAT = C.VAT_owner
AND VAT_vet IN (
	SELECT VAT
	FROM veterinary NATURAL JOIN person
	WHERE name = 'John Smith'
)
GROUP BY C.name,C.VAT_owner;

/*2*/
SELECT name AS 'Indicator Name', reference_value AS 'Reference Value'
FROM indicator
WHERE units = 'milligrams'
GROUP BY reference_value
HAVING reference_value > 100
ORDER BY reference_value DESC;

/*3*/
SELECT consult.name AS 'Animal Name', person.name AS 'Owner Name', animal.species_name AS 'Animal Species', year(current_date)-birth_year AS 'Animal Age'
FROM consult
INner JOIN animal ON consult.name = animal.name
INner JOIN client ON animal.VAT = client.VAT
INner JOIN person ON client.VAT = person.VAT
WHERE o LIKE '%obesity%' OR o LIKE '%obese%'
AND weight > 30
AND (consult.name, VAT_owner, date_timestamp) IN
(SELECT consult.name, VAT_owner,max(date_timestamp)
FROM consult
GROUP BY consult.name,consult.VAT_owner);

/*4*/
SELECT name AS 'Client Name', VAT AS 'Client VAT', concat(address_street,', ',address_zip,' - ',address_city) AS 'Client Address'
FROM person
WHERE VAT IN(
	SELECT VAT
	FROM client
	WHERE VAT NOT IN(
	SELECT VAT
	FROM animal));
	
/*5*/
SELECT diagnosis_code.name AS 'Diagnosis', count(distINct name_med) AS 'Distinct Medication'
FROM diagnosis_code LEFT OUTER JOIN prescription USING(code)
GROUP BY code
ORDER BY count(distINct name_med);

/*6*/
SELECT avg(count_assistants) AS 'Average num of assistants', avg(count_procedures) AS 'Average num of procedures', avg(count_diagnosis_code) AS 'Average num of diagnosis codes', avg(count_prescriptions) AS 'Average num of prescriptions'
FROM
	(SELECT count(participation.VAT_assistant) AS count_assistants, consult.name, consult.VAT_owner, consult.date_timestamp
	FROM consult NATURAL LEFT OUTER JOIN participation
	WHERE YEAR(date_timestamp) = '2017'
	GROUP BY consult.name, consult.VAT_owner, consult.date_timestamp) AS assistants_table NATURAL LEFT OUTER join
	(SELECT count(_procedure.num) AS count_procedures, consult.name, consult.VAT_owner, consult.date_timestamp
	FROM consult NATURAL LEFT OUTER JOIN _procedure
	WHERE YEAR(consult.date_timestamp) = '2017'
	GROUP BY consult.name, consult.VAT_owner, consult.date_timestamp) AS procedures_table NATURAL LEFT OUTER join
	(SELECT count(consult_diagnosis.code) AS count_diagnosis_code, consult.name, consult.VAT_owner, consult.date_timestamp
	FROM consult NATURAL LEFT OUTER JOIN consult_diagnosis
	WHERE YEAR(consult.date_timestamp) = '2017'
	GROUP BY consult.name, consult.VAT_owner, consult.date_timestamp) AS diagnosis_table NATURAL LEFT OUTER join
	(SELECT count(prescription.name_med) AS count_prescriptions, consult.name, consult.VAT_owner, consult.date_timestamp
	FROM consult NATURAL LEFT OUTER JOIN prescription
	WHERE YEAR(consult.date_timestamp) = '2017'
	GROUP BY consult.name, consult.VAT_owner, consult.date_timestamp) AS prescriptions_table
	
/*7*/
SELECT species_name AS 'Animal Species', code AS 'Diagnosis Code', ct AS 'Diagnosis Count'
FROM (
SELECT species_name, code, count(code) ct
FROM animal NATURAL JOIN consult_diagnosis
WHERE species_name IN(
	SELECT name1
	FROM generalization_species
	WHERE name2 = 'Dog'
)
GROUP by species_name, code
order by ct  DESC) AS table_aux
GROUP BY species_name

/*8*/
SELECT DISTINCT name AS 'Person Name', VAT AS 'Person VAT'
FROM ((SELECT person.name, person.VAT
	FROM client INNER JOIN consult
	ON client.VAT = consult.VAT_owner
	INNER JOIN person
	ON person.VAT = client.VAT)
	UNION
	(SELECT person.name, person.VAT
	FROM client INNER JOIN consult
	ON client.VAT = consult.VAT_client
	INNER JOIN person
	ON person.VAT = client.VAT)) AS clients_table
NATURAL JOIN ((SELECT person.VAT
	FROM assistant INNER JOIN person
	ON person.VAT = assistant.VAT)
	UNION
	(SELECT person.VAT
	FROM veterinary INNER JOIN person
	ON person.VAT = veterinary.VAT)) AS staff_table;

/*9*/
SELECT name AS 'Client Name', concat(address_street,', ',address_zip,' - ',address_city) AS 'Client Address'
FROM (SELECT person.name, person.VAT, address_city, address_street, address_zip, species_name
	FROM person INNER JOIN animal
	ON person.VAT = animal.VAT) AS pet_owner_table
GROUP BY name, address_city, address_zip
HAVING COUNT(species_name) = COUNT(CASE WHEN species_name LIKE "%bird%" THEN 1 END);