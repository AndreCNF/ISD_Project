DROP PROCEDURE InsertConsult;
DELIMITER $$

CREATE PROCEDURE InsertConsult(IN name CHAR(50), IN VAT_owner INTEGER, IN date_timestamp TIMESTAMP, IN s TEXT, IN o TEXT, IN a TEXT, IN p TEXT, IN VAT_client INTEGER, IN VAT_vet INTEGER, IN weight NUMERIC(5,2))
BEGIN
	INSERT INTO consult VALUES(name, VAT_owner, date_timestamp, s, o, a, p, VAT_client, VAT_vet, weight);
END$$
DELIMITER ;