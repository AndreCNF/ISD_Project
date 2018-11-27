DROP PROCEDURE AnimalConsultsInfo;
DELIMITER $$

CREATE PROCEDURE AnimalConsultsInfo(IN animal_name VARCHAR(50),IN owner_name VARCHAR(100))
/*RETURNS TABLE(date timestamp, vatVet INTEGER, nameVet VARCHAR(100))*/
BEGIN
/*RETURN TABLE(*/
	SELECT consult.date_timestamp as date,consult.VAT_vet as vatVet,person.name as nameVet
    FROM consult
    INNER JOIN veterinary ON consult.VAT_vet = veterinary.VAT
    INNER JOIN person ON veterinary.VAT = person.VAT
    WHERE consult.name = animal_name
    AND person.name LIKE CONCAT('%',owner_name,'%');
/*)*/
END$$
DELIMITER ;