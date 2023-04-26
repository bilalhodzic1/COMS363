use UniversityDB;
SELECT snum, ssn
FROM students
WHERE name = "Becky";

SELECT major.name, level
FROM major
INNER JOIN students
	ON major.snum = students.snum
WHERE ssn= 123097834;

SELECT courses.name
FROM courses
INNER JOIN departments
	ON department_code = code
WHERE code = 401;

SELECT degrees.name, level
FROM degrees
INNER JOIN departments
	ON department_code = code
WHERE code = 401;

SELECT students.name
FROM students
JOIN minor
ON minor.snum = students.snum;

SELECT distinct COUNT(snum)
FROM minor;

SELECT name, students.snum
FROM students
JOIN register
	ON students.snum = register.snum
WHERE course_number = 311;

SELECT name, snum
FROM students
ORDER BY dob LIMIT 1;

SELECT name, snum
FROM students
ORDER BY dob DESC LIMIT 1;

SELECT name, snum, ssn
FROM students
WHERE name like '%n%' OR name like '%N%';

SELECT name, snum, ssn
FROM students
WHERE name NOT like '%n%' AND name NOT like '%N%';

SELECT course_number, name, count(snum)
FROM register
INNER JOIN courses
	ON course_number = number
GROUP BY name, course_number;


SELECT name
FROM students
JOIN register
	ON register.snum = students.snum
WHERE regtime = "Fall2020";

SELECT courses.name, number
FROM courses
INNER JOIN departments
	ON courses.department_code = code
WHERE code = 401;

SELECT courses.name, number
FROM courses
INNER JOIN departments
	ON courses.department_code = code
WHERE code = 401 OR code = 404;
