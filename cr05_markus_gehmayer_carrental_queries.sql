  ___ ___ _  _ __  __   ___   _____ ___ 
 / __| __| || |  \/  | /_\ \ / / __| _ \
| (_ | _|| __ | |\/| |/ _ \ V /| _||   /
 \___|___|_||_|_|  |_/_/ \_\_| |___|_|_\
--------------------------------------------------------                                       
Queries -->


-- returns all values from table User:
SELECT * FROM `User`;

--return selected 'user' from table User:
SELECT usr_id, usr_first_name, usr_last_name
FROM `User`;

--returns user with the user first name 'Mex':
SELECT usr_id, usr_first_name, usr_email
FROM `User`
WHERE usr_first_name = 'Mex';

-- returns the last name 'Power':
SELECT usr_id, usr_first_name, usr_last_name
FROM `User`
WHERE usr_last_name = 'Power';

-- returns all cars with are available right now:
SELECT car_id, car_mod, car_type, available
FROM `Car_park`
WHERE available = 1;

-- returns all cars which are NOT available:
SELECT car_id, car_mod, car_type, available
FROM `Car_park`
WHERE available = 0;

--returns all accounts created in certain time period:
SELECT *
FROM `Account`
WHERE account_created
BETWEEN '2018:01:07' AND '2019:03:07'

--changes Gustav Gans country of residence to 'Nimmerland'
UPDATE `User`
SET usr_country = 'Nimmerland' WHERE usr_id = 4;

--returns User whose account was created on this date:
SSELECT usr_first_name, usr_last_name, account_created
FROM `User`
INNER JOIN `Account`ON fk_usr_id = usr_id
WHERE account_created = '2019:04:07';

-- returns all from the table:
SELECT * FROM `Inquiry`;

-- returns acount number and car_mod
SELECT  acount_id, car_mod 
FROM `Inquiry`
INNER JOIN `Account` ON fk_account_id = acount_id
INNER JOIN `Car_park` ON fk_car_id = car_id;

-- returns admins  responsible for User account:
SELECT usr_first_name, usr_last_name, admin_first_name, admin_phone 
FROM `Inquiry`
INNER JOIN `Account` ON fk_account_id = acount_id
INNER JOIN `User` ON fk_usr_id = usr_id
INNER JOIN `Admin_car` ON fk_admin_id = admin_id;

-- returns Milage driven by User:
SELECT usr_id, usr_first_name, usr_last_name, report_id, milage_driven 
FROM `report`
INNER JOIN `Contract` ON fk_contract_id = Contract_id
INNER JOIN `Inquiry` ON fk_inq_id = inq_id
INNER JOIN `Account` ON fk_account_id = acount_id
INNER JOIN `User` ON fk_usr_id = usr_id
WHERE milage_driven = 200;

-- returns demage name when demage occured with user name and so on.. :
SELECT usr_id, usr_first_name, usr_last_name, report_id, demage, demage_name
FROM `report`
INNER JOIN `Contract` ON fk_contract_id = Contract_id
INNER JOIN `Inquiry` ON fk_inq_id = inq_id
INNER JOIN `Account` ON fk_account_id = acount_id
INNER JOIN `User` ON fk_usr_id = usr_id
WHERE demage = 1;

--returns  payment dates and payment amount for User:
SELECT usr_id, usr_first_name, usr_last_name, first_payment, first_payment_amount
FROM `Account`
INNER JOIN `payment` ON fk_payment_id = payment_id
INNER JOIN `invoice` ON fk_invoice_id = invoice_id
INNER JOIN `User` ON fk_usr_id = usr_id;

-- returns all invoices and payments for all users:
SELECT usr_id, usr_first_name, usr_last_name, first_payment, first_payment_amount, invoice_id, invoice_amount
FROM `Account`
INNER JOIN `payment` ON fk_payment_id = payment_id
INNER JOIN `invoice` ON fk_invoice_id = invoice_id
INNER JOIN `User` ON fk_usr_id = usr_id;

-- returns all Users which had the first payment in a certain time period:
SELECT usr_id, usr_first_name, usr_last_name, first_payment, first_payment_amount, invoice_id, invoice_amount
FROM `Account`
INNER JOIN `payment` ON fk_payment_id = payment_id
INNER JOIN `invoice` ON fk_invoice_id = invoice_id
INNER JOIN `User` ON fk_usr_id = usr_id
WHERE first_payment BETWEEN '2019:01:01'AND '2019:06:30';

--returns cars at the pick up and dropoff location:
SELECT car_id, car_mod, address_sl, address_el 
FROM `locations`
INNER JOIN `Car_park` ON fk_car_id = car_id
INNER JOIN `start_loc` ON fk_start_loc_id = start_loc_id
INNER JOIN `end_loc` ON fk_end_loc_id = end_loc_id;

-- counts all cars which are available:
SELECT COUNT(*) FROM `Car_park`
WHERE available = 1;

-- counts all cars which are NOT available:
SELECT COUNT(*) FROM `Car_park`
WHERE available = 0;

