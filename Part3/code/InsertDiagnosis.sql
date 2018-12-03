DROP PROCEDURE InsertDiagnosis;
DELIMITER $$

CREATE PROCEDURE InsertDiagnosis(IN code CHAR(5), IN name CHAR(50), IN VAT_owner INTEGER, IN date_timestamp TIMESTAMP)
BEGIN
    INSERT INTO consult_diagnosis VALUES(code, name, VAT_owner, date_timestamp);
END$$
DELIMITER ;