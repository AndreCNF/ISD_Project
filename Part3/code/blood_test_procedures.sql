DROP PROCEDURE InsertBloodTest;
DELIMITER $$

CREATE PROCEDURE InsertBloodTest(IN animal_name VARCHAR(50), IN VAT_owner INTEGER, IN date_timestamp TIMESTAMP, IN num INTEGER, IN white_blood_cell_count NUMERIC(5, 2), IN number_neutrophils NUMERIC(5, 2), IN number_monocytes NUMERIC(5, 2))
INSERT INTO test_procedure VALUES(animal_name, VAT_owner, date_timestamp, num, 'blood');
INSERT INTO produced_indicator VALUES(animal_name, VAT_owner, date_timestamp, num, "White blood cell count", white_blood_cell_count);
INSERT INTO produced_indicator VALUES(animal_name, VAT_owner, date_timestamp, num, "Number of neutrophils", number_neutrophils);
INSERT INTO produced_indicator VALUES(animal_name, VAT_owner, date_timestamp, num, "Number of monocytes", number_monocytes);
END$$
DELIMITER ;