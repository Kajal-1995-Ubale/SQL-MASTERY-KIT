-- Drop the table if it already exists
DROP TABLE IF EXISTS users;

-- Create the users Table
CREATE TABLE IF NOT EXISTS users ( 
user_id SERIAL Primary key ,
username VARCHAR(50) NOT NULL,
Email VARCHAR (100) NOT NULL,
Age INT,
City VARCHAR(50)
);

SELECT * from Users;

-- Insert 5 Sample users into the user table
INSERT INTO users (username,email,age,city) VALUES
('Rajesh','Rajesh@gmail.com',25,'Mumbai'),
('Priya','Priya@gmail.com',34,'Pune'),
('Meera','Meera@gmail.com',23,'Punjab'),
('Kavya','Kavya@gmail.com',24,'Delhi'),
('Neha','Neha@gmail.com',12,'Kolkata');

SELECT user_id,username from users;

-- Update rajesh age to 26 instead of 25
UPDATE users
SET age=26
WHERE user_id=1 AND username='Rajesh';

SELECT * from Users;
--order changed when update the table
SELECT * FROM users
ORDER BY user_id;
-- case sensitive when we are verifying the data 'Rajesh' or 'rajesh' is different

UPDATE users
SET city = 'Chennai'
WHERE user_id=5;

-- multiple update in one query
UPDATE users
SET age=31,city='Kolkata'
WHERE username='Priya';

UPDATE USERS
SET
	AGE = AGE + 1
WHERE
	EMAIL LIKE '%@gmail.com';

-- Alter column and data type in users table 
SELECT * from Users;

-- TO rename the user name to full name 
ALTER TABLE users
RENAME username TO FullName;

-- to change the age column data type from int to smallint
ALTER TABLE users
ALTER Column Age TYPE smallint;

-- to add constraint to CITY - NOT NULL
ALTER TABLE users 
ALTER column City SET NOT NULL;

-- add constraint to AGE - CHECK>0
ALTER TABLE users
ADD CONSTRAINT Age CHECK(Age>0);






















