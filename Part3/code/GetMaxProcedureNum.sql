DROP PROCEDURE GetMaxProcedureNum;
DELIMITER $$

CREATE PROCEDURE GetMaxProcedureNum()
BEGIN
	SELECT max(num)
	FROM _procedure;
END$$
DELIMITER ;