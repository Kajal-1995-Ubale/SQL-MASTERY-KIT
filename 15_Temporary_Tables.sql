-- Temporary Table in SQL 
-- A Temporary Table is a table that exists only for a limited period, usually for the current database session or transaction.
-- temporary tables are automatically removed when the session ends ( or when dropped, depending on the database).

-- why do we use temporary tables?
-- Suppose you have a very complex report.

-- Instead of executing the same expensive query multiple times, you can:

-- Execute the query once.
-- Store the result in a temporary table.
-- Reuse the temporary table multiple times.

-- This improves readability and can improve performance.
CREATE TEMP TABLE exam_summary AS

SELECT
student_id,
AVG(score) AS average_score,
SUM(score) AS total_score

FROM Exam_Scores

GROUP BY student_id;

SELECT *
FROM exam_summary;

-- join temporary table 
SELECT

s.name,
s.branch,
e.average_score

FROM Students s

INNER JOIN exam_summary e

ON s.student_id=e.student_id;

