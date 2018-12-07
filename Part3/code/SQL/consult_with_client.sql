DROP PROCEDURE consult_with_client;
DELIMITER $$

CREATE PROCEDURE consult_with_client(IN animal_name VARCHAR(50),IN owner_vat INTEGER,IN clientVat INTEGER)
BEGIN
	SELECT DISTINCT VAT_client
	FROM consult
	WHERE name = animal_name
	AND VAT_owner = owner_vat
	AND VAT_client = clientVat;
END$$
DELIMITER ;