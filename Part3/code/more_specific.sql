DROP PROCEDURE more_specific;
DELIMITER $$

CREATE PROCEDURE more_specific(IN general_name CHAR(50))
BEGIN
	SELECT DISTINCT name1 AS species_name
    FROM generalization_species
    WHERE name2 = general_name;

END$$
DELIMITER ;