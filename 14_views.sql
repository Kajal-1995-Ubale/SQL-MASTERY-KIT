-- VIEWS 
-- Virtual table that don't store data but simplifies complex queries
-- views can be categorized into several types based on their purpose and implementation.
-- 1. simple view : This view is created from a single table
-- 2. Complex view - created using multiple tables, joins, subqueries or aggregate functions
-- 3. Indexed view  or materialised view : A view that is phycially stored on disk. meaning it precomputes and stores the data.
-- 4. partitioned view : a view that combines data from multiple tables into a single logical table.
-- 5. System view : predefined views provided by sql server querying system related information.

-- How a view works
-- student Table - exam_score table - CREATE VIEW (Student_report)
-- SELECT * from student_report - Database executes the stored SELECT Query - latest data is returned.

CREATE VIEW final_student_report AS

SELECT

s.name,
s.branch,
p.title,
p.marks,
AVG(e.score) AS average_score

FROM Students s

INNER JOIN Projects p
ON s.student_id=p.student_id

INNER JOIN Exam_Scores e
ON s.student_id=e.student_id

GROUP BY
s.name,
s.branch,
p.title,
p.marks;

SELECT * FROM final_student_report;

