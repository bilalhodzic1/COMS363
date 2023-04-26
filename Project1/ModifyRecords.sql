use UniversityDB;
UPDATE students
SET name = "Scott"
WHERE ssn = "746897816";

UPDATE major, students
SET major.name = "Computer Science", level = "MS"
WHERE major.snum = students.snum AND ssn = "746897816";


DELETE FROM register
WHERE regtime = "SPRING2021";
