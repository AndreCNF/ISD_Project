DROP PROCEDURE AnimalInfo;
DELIMITER $$

CREATE PROCEDURE AnimalInfo(IN animal_name VARCHAR(50),IN owner_vat INTEGER, IN date_ TIMESTAMP)
/*RETURNS TABLE(name_owner VARCHAR(100), species VARCHAR(50), colour  VARCHAR(20), gender VARCHAR(20), age INTEGER, weight NUMERIC(5,2))*/
BEGIN
/*RETURN TABLE(*/
	SELECT person.name AS name_owner, species_name AS species, colour, gender, age, consult.weight AS weight
	FROM animal
	INNER JOIN person ON animal.VAT = person.VAT
	INNER JOIN consult ON animal.VAT = consult.VAT_owner AND animal.name = consult.name
	WHERE animal.name = animal_name
	AND animal.VAT = owner_vat
	AND consult.date_timestamp = date_;
/*)*/
END$$
DELIMITER ;