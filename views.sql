/* dim_date(date_timestamp,day,month,year)
   RI: date_timestamp corresponds to a date existing in consults */
CREATE VIEW dim_date AS
SELECT date_timestamp, DAY(date_timestamp) AS day, MONTH(date_timestamp) AS month, YEAR(date_timestamp) AS year
FROM consult;

/* dim_animal(animal_name,animal_vat,species,age)
   animal_name,animal_vat: FK(animal)             */
CREATE view dim_animal AS
SELECT name AS animal_name, VAT AS animal_vat, species_name AS species, year(current_date)-birth_year as age
FROM animal;

/* facts_consults(name,vat,timestamp,num_procedures,num_medications)
   name,vat: FK(dim_animal)
   timestamp: FK(dim_date)                                            */
CREATE view facts_consults AS
SELECT animal_name AS name, animal_vat AS VAT, timestamp, count(num) AS num_procedures, count(DISTINCT name_med, lab, dosage) AS num_medications
FROM
((SELECT *
FROM
(SELECT animal_name, animal_vat, dim_date.date_timestamp AS timestamp, species, num, description, NULL AS code, NULL AS name_med, NULL AS lab, NULL AS dosage, NULL AS regime
    FROM dim_animal LEFT OUTER JOIN _procedure 
    ON dim_animal.animal_name = _procedure.name AND dim_animal.animal_vat = _procedure.VAT_owner
    LEFT OUTER JOIN dim_date 
    ON dim_date.date_timestamp = _procedure.date_timestamp
    WHERE dim_date.date_timestamp IS NOT NULL) AS procedures_table1
NATURAL LEFT OUTER JOIN 
    (SELECT animal_name, animal_vat, dim_date.date_timestamp AS timestamp, species, NULL AS num, NULL AS description, code, name_med, lab, dosage, regime
    FROM dim_animal LEFT OUTER JOIN prescription 
    ON dim_animal.animal_name = prescription.name AND dim_animal.animal_vat = prescription.VAT_owner
    LEFT OUTER JOIN dim_date
    ON dim_date.date_timestamp = prescription.date_timestamp
    WHERE dim_date.date_timestamp IS NOT NULL) AS prescription_table1)
UNION
(SELECT *
FROM
(SELECT animal_name, animal_vat, dim_date.date_timestamp AS timestamp, species, num, description, NULL AS code, NULL AS name_med, NULL AS lab, NULL AS dosage, NULL AS regime
    FROM dim_animal LEFT OUTER JOIN _procedure 
    ON dim_animal.animal_name = _procedure.name AND dim_animal.animal_vat = _procedure.VAT_owner
    LEFT OUTER JOIN dim_date 
    ON dim_date.date_timestamp = _procedure.date_timestamp
    WHERE dim_date.date_timestamp IS NOT NULL) AS procedures_table2
NATURAL RIGHT OUTER JOIN 
    (SELECT animal_name, animal_vat, dim_date.date_timestamp AS timestamp, species, NULL AS num, NULL AS description, code, name_med, lab, dosage, regime
    FROM dim_animal LEFT OUTER JOIN prescription 
    ON dim_animal.animal_name = prescription.name AND dim_animal.animal_vat = prescription.VAT_owner
    LEFT OUTER JOIN dim_date
    ON dim_date.date_timestamp = prescription.date_timestamp
    WHERE dim_date.date_timestamp IS NOT NULL) AS prescription_table2)) AS union_table
GROUP BY name, VAT, timestamp
/* Doing a union of similar joins, but first with left outer join and then right outer join. This is equivalent
   to a full outer join, getting data from both sides even if it doesn't match with the other side.             */