DROP PROCEDURE DiagnosisInfo;
DELIMITER $$

CREATE PROCEDURE DiagnosisInfo(IN animal_name VARCHAR(50),IN owner_vat INTEGER, IN date_ TIMESTAMP)
/*RETURNS TABLE(code CHAR(5), name CHAR(100))*/
BEGIN
/*RETURN TABLE(*/
	SELECT diagnosis_code.code AS code, diagnosis_code.name AS name
    FROM consult_diagnosis
    INNER JOIN diagnosis_code ON consult_diagnosis.code = diagnosis_code.code
    WHERE consult_diagnosis.name = animal_name
    AND consult_diagnosis.VAT_owner = owner_vat
    AND consult_diagnosis.date_timestamp = date_;
/*)*/
END$$
DELIMITER ;