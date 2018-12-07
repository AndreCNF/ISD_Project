DROP PROCEDURE SearchConsultName;
DELIMITER $$

CREATE PROCEDURE SearchConsultName(IN animal_name VARCHAR(50),IN owner_name VARCHAR(100),IN clientVat INTEGER)
/*RETURNS TABLE(animal VARCHAR(50), vat INTEGER, owner VARCHAR(100), thisClient BOOLEAN)*/
BEGIN
/*RETURN TABLE(*/
	SELECT consult.name as animal,consult.VAT_owner as vat,person.name as owner, VAT_client = clientVat as thisClient
	FROM consult
	INNER JOIN client ON consult.VAT_owner = client.VAT
	INNER JOIN person ON client.VAT = person.VAT
	WHERE consult.name = animal_name
	AND person.name LIKE CONCAT('%',owner_name,'%');
/*)*/
END$$
DELIMITER ;
	/*DECLARE neg_balance numeric(20,2);
	SELECT sum(balance) into pos_balance
	from account natural join depositor
	where customer_name = c_name;
	select sum(amount) into neg_balance
	from loan natural join borrower
	where customer_name = c_name;

	if pos_balance is NULL then
	set pos_balance = 0;
	end if;
	if neg_balance is NULL then
	set neg_balance = 0;
	end if;
	return pos_balance - neg_balance;*/	
/*end$$*/