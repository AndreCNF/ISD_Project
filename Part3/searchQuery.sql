DROP FUNCTION SearchConsultName;
delimiter $$

CREATE FUNCTION SearchConsultName(animal_name VARCHAR(50),owner_name VARCHAR(100),clientVat INTEGER)
RETURNS TABLE (animal VARCHAR(50), vat INTEGER, owner VARCHAR(100), thisClient BOOLEAN)
BEGIN
    DECLARE result TABLE
	SELECT consult.name,consult.VAT_owner,person.name, "VAT = VAT testar isto"
    FROM consult
    INNER JOIN client ON consult.VAT_owner = client.VAT
    INNER JOIN person ON client.VAT = person.VAT
    WHERE consult.name = animal_name
    AND person.name LIKE '%owner_name%'

    
	DECLARE neg_balance numeric(20,2);
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
	return pos_balance - neg_balance;	
end$$