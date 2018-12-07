DROP PROCEDURE get_vat_from_name;
DELIMITER $$

CREATE PROCEDURE get_vat_from_name(IN owner_name CHAR(100))
BEGIN
	SELECT person.VAT AS VAT, person.name AS NAME
	FROM person INNER JOIN client USING(VAT)
	WHERE person.name LIKE CONCAT('%',owner_name,'%');
END$$
DELIMITER ;