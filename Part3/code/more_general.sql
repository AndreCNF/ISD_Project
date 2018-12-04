DROP PROCEDURE more_general;
DELIMITER $$

CREATE PROCEDURE more_general()
BEGIN
	SELECT DISTINCT name2 AS species_name
    FROM generalization_species
    WHERE name2 != ALL (
        SELECT name1
        FROM generalization_species
    );

END$$
DELIMITER ;