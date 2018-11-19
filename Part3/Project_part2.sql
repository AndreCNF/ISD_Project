/*1*/
DELIMITER $$

CREATE TRIGGER ageUpdate BEFORE INSERT ON consult
FOR EACH ROW
BEGIN
    UPDATE animal
    SET age = YEAR(current_date)-birth_year
    WHERE name = new.name
    AND VAT = new.VAT_owner;
END$$

DELIMITER ;

/*TEST 1*/
SELECT VAT, name, age
FROM animal;

INSERT INTO consult(name,VAT_owner,VAT_client,VAT_vet,weight) VALUES('Bobi',12345678,12345678,12032014,10);

/*2*/
DROP TRIGGER vetNotAssist;
DROP TRIGGER assistNotVet;

DELIMITER $$

CREATE TRIGGER vetNotAssist BEFORE INSERT ON assistant
FOR EACH ROW
BEGIN
    DECLARE vet_cannot_be_a_assistant CONDITION FOR SQLSTATE '45001';
    DECLARE EXIT HANDLER FOR vet_cannot_be_a_assistant
    BEGIN
    SIGNAL vet_cannot_be_a_assistant SET MESSAGE_TEXT = 'This person is already registered as a Veterinary. A person cannot be a Assistant and a Veterinary at the same time.';
    END;
IF EXISTS(
    SELECT VAT
    FROM veterinary
    WHERE veterinary.VAT = new.VAT
)THEN
    SIGNAL vet_cannot_be_a_assistant;

END IF;
END$$

CREATE TRIGGER assistNotVet BEFORE INSERT ON veterinary
FOR EACH ROW
BEGIN
    DECLARE assistant_cannot_be_a_vet CONDITION FOR SQLSTATE '45001';
    DECLARE EXIT HANDLER FOR assistant_cannot_be_a_vet
    BEGIN
    SIGNAL assistant_cannot_be_a_vet SET MESSAGE_TEXT = 'This person is already registered as a Assistant. A person cannot be a Assistant and a Veterinary at the same time.';
    END;
IF EXISTS(
    SELECT VAT
    FROM assistant
    WHERE assistant.VAT = new.VAT
)THEN
    SIGNAL assistant_cannot_be_a_vet;

END IF;
END$$

DELIMITER ;

/*TEST 2*/
SELECT VAT
FROM veterinary;

SELECT VAT
FROM assistant;

INSERT INTO assistant(VAT) VALUES (12032014);

/*3*/
DROP TRIGGER phoneNotDuplicateInsert;
DROP TRIGGER phoneNotDuplicateUpdate;

DELIMITER $$

CREATE TRIGGER phoneNotDuplicateInsert BEFORE INSERT ON phone_number
FOR EACH ROW
BEGIN
    DECLARE phone_already_exists CONDITION FOR SQLSTATE '45000';
    DECLARE EXIT HANDLER FOR phone_already_exists
    BEGIN
    SIGNAL phone_already_exists SET MESSAGE_TEXT = 'This phone number already exists.';
    END;
IF EXISTS(
    SELECT phone
    FROM phone_number
    WHERE phone = new.phone
)THEN
    SIGNAL phone_already_exists;
END IF;
END$$

CREATE TRIGGER phoneNotDuplicateUpdate BEFORE UPDATE ON phone_number
FOR EACH ROW
BEGIN
    DECLARE phone_already_exists CONDITION FOR SQLSTATE '45000';
    DECLARE EXIT HANDLER FOR phone_already_exists
    BEGIN
    SIGNAL phone_already_exists SET MESSAGE_TEXT = 'This phone number already exists.';
    END;
IF EXISTS(
    SELECT phone
    FROM phone_number
    WHERE phone = new.phone
)THEN
    SIGNAL phone_already_exists;
END IF;
END$$

DELIMITER ;

/*TEST 3*/
SELECT *
FROM phone_number;

DELETE FROM phone_number WHERE VAT = 12032014;
INSERT INTO phone_number VALUES(12032014,'930536378');
UPDATE phone_number SET phone = '930536378' WHERE VAT = 12032014;


/*4*/
DELIMITER $$

CREATE FUNCTION number_consult_year(a_vat INTEGER,a_name CHAR(50),c_year YEAR)
RETURNS INTEGER
BEGIN

    DECLARE count_result INTEGER;

    SELECT COUNT(date_timestamp) INTO count_result
    FROM consult
    WHERE (date_timestamp) IN(
    SELECT date_timestamp
    FROM consult
    WHERE name = a_name
    AND VAT_owner = a_vat
    AND YEAR(date_timestamp) = c_year
    );

    RETURN count_result;

END$$

DELIMITER ;

/*5*/
DELIMITER $$

CREATE PROCEDURE change2centigrams()
BEGIN
    DECLARE ind_name CHAR(30);
    DECLARE done INT DEFAULT FALSE;

    DECLARE c CURSOR FOR
    SELECT name
    FROM indicator
    WHERE units = 'milligrams';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN c;
    REPEAT
    FETCH c INTO ind_name;
    IF NOT done THEN
    UPDATE produced_indicator
    SET value = value/10
    WHERE indicator_name = ind_name;
    END IF;
    UNTIL done
    END REPEAT;
    CLOSE c;

    UPDATE indicator
    SET units = 'centigrams', reference_value = reference_value/10
    WHERE units = 'milligrams';
END$$

DELIMITER ;

/* TEST 5 */
SELECT * FROM indicator;
SELECT * FROM produced_indicator;

CALL change2centigrams();