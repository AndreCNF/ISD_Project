DROP PROCEDURE AnimalInfo;
DELIMITER $$

CREATE PROCEDURE AnimalInfo(IN animal_name VARCHAR(50),IN owner_vat INTEGER)
/*RETURNS TABLE(name_owner VARCHAR(100), species VARCHAR(50), colour  VARCHAR(20), gender VARCHAR(20), age INTEGER)*/
BEGIN
/*RETURN TABLE(*/
	SELECT person.name AS name_owner, species_name AS species, colour, gender, age
    FROM animal
    INNER JOIN person ON animal.VAT = person.VAT
    WHERE animal.name = animal_name
    AND animal.VAT = owner_vat;
/*)*/
END$$
DELIMITER ;