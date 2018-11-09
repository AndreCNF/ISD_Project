/* dim_date(date_timestamp,day,month,year)
   RI: date_timestamp corresponds to a date existing in consults */
CREATE VIEW dim_date AS
SELECT date_timestamp, DAY(date_timestamp) AS day, MONTH(date_timestamp) AS month, YEAR(date_timestamp) AS year
FROM consult;

/* dim_animal(animal_name,animal_vat,species,age)
   animal_name,animal_vat: FK(animal)             */
CREATE VIEW dim_animal AS
SELECT name AS animal_name, VAT AS animal_vat, species_name AS species, YEAR(CURRENT_DATE)-birth_year AS age
FROM animal;

/* facts_consults(name,vat,timestamp,num_procedures,num_medications)
   name,vat: FK(dim_animal)
   timestamp: FK(dim_date)                                            */

-- Intermediate view
CREATE VIEW union_table_view AS 
(SELECT animal_name, animal_vat, dim_date.date_timestamp AS timestamp, species, num, description, NULL AS code, NULL AS name_med, NULL AS lab, NULL AS dosage, NULL AS regime
    FROM dim_animal LEFT OUTER JOIN _procedure 
    ON dim_animal.animal_name = _procedure.name AND dim_animal.animal_vat = _procedure.VAT_owner
    LEFT OUTER JOIN dim_date 
    ON dim_date.date_timestamp = _procedure.date_timestamp
    WHERE dim_date.date_timestamp IS NOT NULL)
UNION
    (SELECT animal_name, animal_vat, dim_date.date_timestamp AS timestamp, species, NULL AS num, NULL AS description, code, name_med, lab, dosage, regime
    FROM dim_animal LEFT OUTER JOIN prescription 
    ON dim_animal.animal_name = prescription.name AND dim_animal.animal_vat = prescription.VAT_owner
    LEFT OUTER JOIN dim_date
    ON dim_date.date_timestamp = prescription.date_timestamp
    WHERE dim_date.date_timestamp IS NOT NULL);

CREATE VIEW facts_consults AS
SELECT animal_name AS name, animal_vat AS VAT, timestamp, COUNT(num) AS num_procedures, COUNT(DISTINCT name_med, lab, dosage) AS num_medications
FROM union_table_view
GROUP BY name, VAT, timestamp;
/* Need to do an intermediate view that joins the procedures and prescriptions, much like a full
   full outer join would do, without ignoring values to which one of the sides doesn't match.    */