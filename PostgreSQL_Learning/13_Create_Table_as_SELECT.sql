-- CREATE TABLE AS SELECT
-- CREATE TABLE AS SELECT (CTAS) is a SQL statement used to create a new table using the result of a SELECT query.

-- Instead of:

-- Creating a table
-- Defining columns
-- Inserting data separately

-- You can do everything in one statement.

-- how it works 
-- Existing table -- SELECT query (filter/join/group by) --- create table (new table created)
SELECT * from students;
-- create a new table 
CREATE TABLE student_names AS
SELECT student_id,
name 
from students;

SELECT * from student_names;

CREATE TABLE student_exam_details AS

SELECT
s.student_id,
s.name,
s.branch,
e.subject,
e.score
FROM Students s
INNER JOIN Exam_Scores e
ON s.student_id = e.student_id;

SELECT * from student_exam_details;
