DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;

DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Enrollments;

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    student_age INT NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT
);

CREATE TABLE Enrollments (
    enrollment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students (student_name, student_age)
VALUES ('Humbert Vicarey', 21),
		('Raynell McAlester', 20),
		('Lia Tethacot', 19),
		('Carmelita Rosedale', 24),
		('Beaufort Paszek', 21),
		('Bell Wheaton', 24),
		('Lelia Archibold', 19),
		('Wallas Odd', 18),
		('Angelico Fishpoole', 22),
		( 'Arabele Wolfenden', 19),
		( 'Sayer Dentith', 22),
		( 'Dolf Pallant', 21),
		( 'Aldwin Lowton', 18),
		( 'Carley Janowski', 22),
		( 'Tootsie Ousby', 22),
		( 'Lola Costigan', 24),
		( 'Emmet Laurent', 21),
		( 'Meredith Cyphus', 20),
		( 'Anselma Bather', 24),
		( 'Brannon McMurtyr', 21);

INSERT INTO Courses (course_name, course_description)
VALUES ('Python Fundamentals', 'Mastering Python Programming'),
		('Digital Marketing', 'Digital Marketing Essentials'),
		('AI Fundamentals', 'Artificial Intelligence Fundamentals'),
		('Creative Writing Workshop', 'Creative Writing Workshop'),
		('Financial Planning Fundamentals', 'Financial Planning 101'),
		('Photography for Beginners', 'Photography for Beginners'),
		('Effective Time Management', 'Effective Time Management'),
		('Introduction to Psychology', 'Introduction to Psychology'),
		('Eco-Friendly Living: Sustainability Course', 'Eco-Friendly Living: Sustainability Course'),
		('History of Ancient Civilizations', 'History of Ancient Civilizations'),
		('Yoga and Mindfulness Meditation', 'Yoga and Mindfulness Meditation'),
		('Entrepreneurship Bootcamp', 'Entrepreneurship Bootcamp'),
		('Graphic Design for Beginners', 'Graphic Design for Beginners'),
		('Data Science and Machine Learning', 'Data Science and Machine Learning'),
		('Introduction to Astrophysics', 'Introduction to Astrophysics'),
		('Culinary Arts: Mastering Cooking Techniques', 'Culinary Arts: Mastering Cooking Techniques'),
		('Effective Communication Skills', 'Effective Communication Skills'),
		('Cybersecurity Basics', 'Cybersecurity Basics'),
		('Public Speaking Mastery', 'Public Speaking Mastery'),
		('Music Theory and Composition', 'Music Theory and Composition');
        
INSERT INTO Enrollments (student_id, course_id)
VALUES (1,1),
		(1,2),
		(1,3),
		(1,5),
		(2,2),
		(2,3),
		(1,6),
		(3,1),
		(4,2),
		(5,3),
		(6,6),
		(7,1),
		(7,2),
		(7,4),
		(8,2),
		(8,3),
		(9,2),
		(9,3),
		(9,4),
		(9,5);
        
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

-- Bài tập 1: Lấy danh sách tất cả sinh viên và thông tin khóa học mà họ đã đăng ký.
SELECT s.student_id as 'Student ID', s.student_name as 'Student Name', c.course_name as 'Course Name'
FROM Students s
INNER JOIN Enrollments e
ON s.student_id = e.student_id
INNER JOIN Courses c
ON e.course_id = c.course_id;

-- Bài tập 2: Lấy tên của tất cả các khóa học mà một sinh viên cụ thể đã đăng ký (sử dụng tham số student_id).
SELECT c.course_name as 'Course Name'
FROM Students s
INNER JOIN Enrollments e
ON s.student_id = e.student_id
INNER JOIN Courses c
ON e.course_id = c.course_id
WHERE s.student_id = 9;

-- Bài tập 3: Lấy danh sách tất cả sinh viên và số lượng khóa học mà họ đã đăng ký.
SELECT s.student_id as 'Student ID', s.student_name as 'Student Name', count(c.course_name) as 'Number of enrolled courses'
FROM Students s
INNER JOIN Enrollments e
ON s.student_id = e.student_id
INNER JOIN Courses c
ON e.course_id = c.course_id
GROUP BY s.student_id, s.student_name;

-- Bài tập 4: Lấy tất cả các khóa học mà chưa có sinh viên nào đăng ký.
SELECT c.course_name as 'Course Name'
FROM Students s
RIGHT JOIN Enrollments e
ON s.student_id = e.student_id
RIGHT JOIN Courses c
ON e.course_id = c.course_id
WHERE s.student_id IS NULL;

-- Bài tập 5: Lấy tất cả sinh viên và thông tin khóa học mà họ đã đăng ký, sắp xếp theo tên sinh viên và tên khóa học.
SELECT s.student_id as 'Student ID', s.student_name as 'Student Name', c.course_name as 'Course Name'
FROM Students s
INNER JOIN Enrollments e
ON s.student_id = e.student_id
INNER JOIN Courses c
ON e.course_id = c.course_id
ORDER BY s.student_name, c.course_name;

-- Bài tập 6: Lấy tất cả các sinh viên và thông tin của họ, cùng với tên khóa học mà họ đăng ký (nếu có).
SELECT s.student_id as 'Student ID', s.student_name as 'Student Name', c.course_name as 'Course Name'
FROM Students s
LEFT JOIN Enrollments e
ON s.student_id = e.student_id
LEFT JOIN Courses c
ON e.course_id = c.course_id;

-- Bài tập 7: Lấy danh sách tất cả sinh viên và thông tin của họ, cùng với tên khóa học mà họ đăng ký (nếu có). Sắp xếp theo tên sinh viên và tuổi từ cao xuống thấp.
SELECT s.student_id as 'Student ID', s.student_name as 'Student Name', s.student_age as 'Student Age', c.course_name as 'Course Name'
FROM Students s
LEFT JOIN Enrollments e
ON s.student_id = e.student_id
LEFT JOIN Courses c
ON e.course_id = c.course_id
ORDER BY s.student_name ASC, s.student_age DESC;

-- Bài tập 8: Lấy tất cả các khóa học và số lượng sinh viên đã đăng ký vào mỗi khóa học.
SELECT c.course_name as 'Course Name', count(s.student_id) as 'Enrolled students'
FROM Students s
INNER JOIN Enrollments e
ON s.student_id = e.student_id
INNER JOIN Courses c
ON e.course_id = c.course_id
GROUP BY c.course_name;