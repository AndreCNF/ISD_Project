DROP PROCEDURE PrescriptionsInfo;
DELIMITER $$

CREATE PROCEDURE PrescriptionsInfo(IN animal_name VARCHAR(50),IN owner_vat INTEGER, IN date_ TIMESTAMP)
/*RETURNS TABLE(code CHAR(5), name_med CHAR(20), lab CHAR(20), dosage CHAR(100), regime CHAR(100))*/
BEGIN
/*RETURN TABLE(*/
	SELECT code, name_med, lab, dosage, regime
    FROM prescription
    WHERE prescription.name = animal_name
    AND prescription.VAT_owner = owner_vat
    AND prescription.date_timestamp = date_;
/*)*/
END$$
DELIMITER ;