DROP PROCEDURE SearchConsultName;
DELIMITER $$

CREATE PROCEDURE SearchConsultName(IN animal_name VARCHAR(50),IN owner_name VARCHAR(100),IN clientVat INTEGER)
BEGIN
	SELECT DISTINCT animal.name as animal,animal.VAT as vat,person.name as owner
    FROM animal
    INNER JOIN client ON animal.VAT = client.VAT
    INNER JOIN person ON client.VAT = person.VAT
    WHERE animal.name = animal_name
    AND person.name LIKE CONCAT('%',owner_name,'%');
END$$
DELIMITER ;