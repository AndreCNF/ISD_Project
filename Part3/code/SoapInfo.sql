DROP PROCEDURE SoapInfo;
DELIMITER $$

CREATE PROCEDURE SoapInfo(IN animal_name VARCHAR(50),IN owner_vat INTEGER, IN date_ TIMESTAMP)
/*RETURNS TABLE(s TEXT, o TEXT, a TEXT, p TEXT)*/
BEGIN
/*RETURN TABLE(*/
	SELECT s, o, a, p
	FROM consult
	WHERE consult.name = animal_name
	AND consult.VAT_owner = owner_vat
	AND consult.date_timestamp = date_;
/*)*/
END$$
DELIMITER ;