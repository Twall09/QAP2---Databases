-- CREATING THE TABLES

-- Students table:
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(75) NOT NULL,
    school_enrollment_date DATE NOT NULL,
);

-- Professors table
CREATE TABLE professors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(75) NOT NULL,
);

-- Courses table
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(75) NOT NULL,
    course_description VARCHAR(200) TEXT,
    professor_id INT NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES professors(id)
);

-- Enrollments table
CREATE TABLE enrollments (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- INSERT DATA:

-- Insert at least 5 students:
INSERT INTO students (first_name, last_name, email, school_enrollment_date) VALUES
('Tyler', 'Wall', 'tyler.wall@example.com', '2024-01-07'),
('Auston', 'Matthews', 'a.matthews@example.com', '2024-01-07'),
('Conner', 'McDavid', 'cmc.mcdavid@example.com', '2024-01-07'),
('David', 'Pastrnak', 'david.pastrnak@example.com', '2024-01-07'),
('Nathan', 'Mackinnon', 'nathan.mack@example.com', '2024-01-07');

-- Insert 4 professors:
INSERT INTO professors (first_name, last_name, department) VALUES
('Patrick', 'Mahomes', 'Physics'),
('Aaron', 'Rodgers', 'Math'),
('Tom', 'Brady', 'Computer Science'),
('Josh', 'Allen', 'Biology');

-- 3 courses:
INSERT INTO courses (course_name, course_description, professor_id) VALUES
('AWS Academy', 'Cloud Development', 3),
('Physics 101', 'Introduction to Physics', 1),
('Phys Ed', 'Healthy Living class', 4);

-- 5 enrollments total, enroll students in multiple different courses
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-10'),  -- Tyler enrolled in AWS Academy
(2, 1, '2024-01-10'),  -- Auston enrolled in AWS Acadmey
(3, 2, '2024-01-12'),  -- Conner enrolled in Physics 101
(3, 3, '2024-01-11'),  -- Conner enrolled Phys Ed
(5, 2, '2024-01-10');  -- Nathan enrolled in Physics 101




