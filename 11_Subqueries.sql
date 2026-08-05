-- subquery 
-- Query inside another Query

CREATE TABLE Students(
student_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
branch VARCHAR(30) NOT NULL
);

CREATE TABLE Exam_Scores(
score_id SERIAL PRIMARY KEY,
student_id INT NOT NULL REFERENCES Students(student_id),
subject VARCHAR(30) NOT NULL,
score INT NOT NULL CHECK(score BETWEEN 0 AND 100),
exam_month VARCHAR(7) NOT NULL
);

CREATE TABLE projects(
project_id SERIAL PRIMARY KEY,
student_id INT NOT NULL REFERENCES Students(student_id),
title VARCHAR(80) NOT NULL,
marks INT NOT NULL CHECK (marks BETWEEN 0 AND 100)
);

INSERT INTO Students (name, branch)
VALUES
('Aarav Sharma', 'Computer Science'),
('Priya Patil', 'Information Technology'),
('Rohan Mehta', 'Electronics'),
('Sneha Kulkarni', 'Mechanical'),
('Aditya Singh', 'Civil'),
('Neha Verma', 'Computer Science'),
('Rahul Joshi', 'Information Technology'),
('Pooja Deshmukh', 'Electronics'),
('Karan Gupta', 'Mechanical'),
('Anjali Nair', 'Civil'),
('Vikas Yadav', 'Computer Science'),
('Meera Iyer', 'Information Technology'),
('Sahil Khan', 'Electronics'),
('Ritika Jain', 'Mechanical'),
('Arjun Patil', 'Civil'),
('Kavya Rao', 'Computer Science'),
('Manish Das', 'Information Technology'),
('Simran Kaur', 'Electronics'),
('Nikhil Shah', 'Mechanical'),
('Ishita Bose', 'Civil');

INSERT INTO Exam_Scores (student_id, subject, score, exam_month)
VALUES
(1, 'SQL', 92, '2026-01'),
(2, 'Python', 85, '2026-01'),
(3, 'DBMS', 78, '2026-01'),
(4, 'SQL', 88, '2026-01'),
(5, 'Python', 67, '2026-01'),
(6, 'DBMS', 95, '2026-01'),
(7, 'SQL', 73, '2026-02'),
(8, 'Python', 89, '2026-02'),
(9, 'DBMS', 82, '2026-02'),
(10, 'SQL', 91, '2026-02'),
(11, 'Python', 76, '2026-02'),
(12, 'DBMS', 84, '2026-03'),
(13, 'SQL', 69, '2026-03'),
(14, 'Python', 94, '2026-03'),
(15, 'DBMS', 81, '2026-03'),
(16, 'SQL', 97, '2026-04'),
(17, 'Python', 74, '2026-04'),
(18, 'DBMS', 87, '2026-04'),
(19, 'SQL', 79, '2026-04'),
(20, 'Python', 90, '2026-04');

INSERT INTO Projects (student_id, title, marks)
VALUES
(1, 'Library Management System', 94),
(2, 'Online Shopping Portal', 88),
(3, 'Smart Traffic Control', 81),
(4, 'Hospital Management System', 90),
(5, 'Bridge Design Analysis', 75),
(6, 'Student Attendance System', 96),
(7, 'Weather Forecast Dashboard', 84),
(8, 'IoT Home Automation', 89),
(9, 'Manufacturing Monitoring', 77),
(10, 'Smart City Planning', 86),
(11, 'Employee Payroll System', 83),
(12, 'E-Learning Platform', 91),
(13, 'Robotics Control System', 72),
(14, 'Inventory Management', 95),
(15, 'Road Construction Planner', 80),
(16, 'AI Chatbot', 98),
(17, 'Movie Recommendation System', 85),
(18, 'Face Recognition System', 92),
(19, 'Production Scheduling', 78),
(20, 'Water Supply Management', 87);

SELECT * from Students;
SELECT * from Projects;
SELECT * from Exam_Scores;

-- Subquery -- Nested Query 

-- what is the avg score of all subjects 
-- konse aise exam ke attempts hai jinho ne jyada score liya hai avg score 
SELECT AVG(Score) as class_average
FROM Exam_Scores;


SELECT s.name as student_name,
s.branch as Student_batch,
e.score as score
from Exam_scores as e
INNER JOIN students as s
ON s.student_id=e.student_id;

-- Exam score should be greater than avg of score -- for that we need to use subquery 

SELECT s.name as student_name,
s.branch as Student_batch,
e.score as score
from Exam_scores as e
INNER JOIN students as s
ON s.student_id=e.student_id
WHERE e.score > (
					SELECT AVG(Score) as class_average
					FROM Exam_Scores
);

-- pro tip : if your where condition is integer than technicall your inside query should have one column with int data type

-- 2nd question placement drive - 
-- criteria 
-- 1. AT least 1 exam attempt have score >90
-- * AND
-- 2. Any one of their projects should have marks >85

SELECT * from Exam_Scores WHERE score>=90;

SELECT * from Projects WHERE marks>=85;

SELECT s.student_id,
s.name,s.branch from students as s
WHERE s.student_id IN (SELECT student_id from Exam_Scores WHERE score>=90)
AND s.student_id IN (SELECT student_id from Projects WHERE marks>=85);

-- question 3 -- we need to have total score student has earned and number of exams student has attempted
-- we also need to have student name and branch in the result

SELECT student_id,SUM(score) as total_scores,
COUNT(*) as number_of_attepts from Exam_scores
GROUP BY student_id;

-- we can use this table as temporary table inside another query 

SELECT s.name,s.branch,total_stats.total_scores,
total_stats.number_of_attempts
FROM (
	SELECT student_id,SUM(score) as total_scores,
COUNT(*) as number_of_attempts from Exam_scores
GROUP BY student_id
) as total_stats -- act as temporary table
INNER JOIN students as s 
ON s.student_id = total_stats.student_id
ORDER BY total_stats.total_scores DESC;

-- question 4: 
-- for each project get student's name, branch, project marks,
-- and their average exam score on the same row

SELECT student_id,
AVG(score) as avg_score
from Exam_scores
GROUP BY student_id;

-- details of project  and student 
SELECT  s.name,
s.branch,
p.title, p.marks,
exam_avg.avg_score
from projects as p
INNER JOIN students as s
ON p.student_id = s.student_id 
INNER JOIN (SELECT student_id,
AVG(score) as avg_score
from Exam_scores
GROUP BY student_id) as exam_avg 
ON exam_avg.student_id =p.student_id;












