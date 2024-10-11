-- TASKS

-- Retrieve the names of the students who enrolled in Physics 101

SELECT s.first_name || ' ' || s.last_name AS student_full_name 
FROM students s
JOIN enrollments e ON s.id = e.student_id
WHERE e.course.id = (SELECT id FROM courses WHERE course_name = 'Physics 101');

-- Retrieve a list of all courses along with the professor’s full name who teaches each course.

SELECT p.first_name || ' ' || p.last_name AS professor_full_name
FROM courses c
JOIN professors p ON c.professor_id = p.id;

-- Retrieve all courses that have students enrolled in them.

SELECT c.id, c.course_name, COUNT(e.student_id) AS enrolled_students
FROM courses c
JOIN enrollments e ON c.id = e.course_id;


-- UPDATE DATA

-- update one of the students emails
UPDATE students
SET email = 't.wall@example.com'
WHERE id = 1;  -- should update Tyler's email

-- DELETE DATA

-- Remove a student from one of their courses.
DELETE FROM enrollments
WHERE student_id = 3 AND course_id = 3;  -- Should remove Conner from Physics 101

