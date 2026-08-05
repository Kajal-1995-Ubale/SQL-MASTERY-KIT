-- A Stored Procedure is a named block of SQL code stored in the database that can be executed repeatedly with or without input parameters.

-- Real-Life Analogy

-- Imagine you work in a bank.

-- Every day, employees perform the same steps to transfer money:

-- Check account balance.
-- Verify the account.
-- Deduct money.
-- Add money to another account.
-- Save the transaction.

-- Instead of writing these SQL statements every day, you write them once inside a stored procedure and simply execute it whenever a transfer is needed.

-- Why Use Stored Procedures?

-- Without a stored procedure:

-- Application
--     │
--     ▼
-- Write SQL Again
-- Write SQL Again
-- Write SQL Again

-- With a stored procedure:

-- Application
--       │
--       ▼
-- EXEC ProcedureName
--       │
--       ▼
-- Database executes all SQL automatically

-- CREATE OR REPLACE PROCEDURE procedure_name()

-- LANGUAGE plpgsql

-- AS $$

-- BEGIN

--     SQL Statements;

-- END;

-- $$;
DROP PROCEDURE GetStudents();
CREATE OR REPLACE FUNCTION GetStudents()

RETURNS TABLE
(
student_id INT,
name VARCHAR,
branch VARCHAR
)

LANGUAGE plpgsql

AS $$

BEGIN

RETURN QUERY

SELECT
s.student_id,
s.name,
s.branch
FROM Students s;

END;

$$;


SELECT * FROM GetStudents();



-- Insert Data using SP 
CREATE OR REPLACE FUNCTION AddStudent()

RETURNS TABLE
(
student_id INT,
name VARCHAR,
branch VARCHAR
)

LANGUAGE plpgsql

AS $$

BEGIN

RETURN QUERY
INSERT INTO Students

(name,branch)

VALUES

(student_name,student_branch);


END;

$$;

SELECT * FROM AddStudent(
    'Rahul',
    'Computer Science'
);

-- check if the function exists 
SELECT
    routine_name,
    routine_type
FROM information_schema.routines
WHERE routine_name ILIKE 'addstudent';


CREATE OR REPLACE FUNCTION AddStudent(

    p_name VARCHAR,
    p_branch VARCHAR

)

RETURNS VOID

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO Students(name, branch)
    VALUES (p_name, p_branch);

END;

$$;

SELECT AddStudent(
    'Rahul',
    'Computer Science'
);



