DROP DATABASE IF EXISTS AttendanceSystemDB;
CREATE DATABASE AttendanceSystemDB;
USE AttendanceSystemDB;

CREATE TABLE Students (
    StudentID VARCHAR(10) PRIMARY KEY,
    SFirstName VARCHAR(50)  NOT NULL,
    SLastName VARCHAR(50)  NOT NULL,
    SPhone VARCHAR(20),
    EnrollmentYear INT CHECK (EnrollmentYear >= 2000),
    Status VARCHAR(10) DEFAULT 'Active'
        CHECK (Status IN ('Active', 'Inactive'))
);

CREATE TABLE Lecturers (
    LecturerID INT PRIMARY KEY AUTO_INCREMENT,
    LFirstName VARCHAR(50) NOT NULL,
    LLastName VARCHAR(50) NOT NULL,
    LEmail VARCHAR(100) UNIQUE,
    Department VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID VARCHAR(15) PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits BETWEEN 1 AND 6),
    Semester VARCHAR(20),          -- e.g. '2025S1'
    Section VARCHAR(10) NOT NULL, 
    LecturerID INT NOT NULL,
    
    FOREIGN KEY (LecturerID) REFERENCES Lecturers(LecturerID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID VARCHAR(10) NOT NULL,
    CourseID VARCHAR(15) NOT NULL,
    EnrollmentDate DATE DEFAULT (CURRENT_DATE),
    
    Status VARCHAR(10) DEFAULT 'Enrolled'
        CHECK (Status IN ('Enrolled', 'Dropped')),
        
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID)  REFERENCES Courses(CourseID),
    
    UNIQUE (StudentID, CourseID)
);

CREATE TABLE Sessions (
    SessionID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID VARCHAR(15) NOT NULL,
    SessionDate DATETIME NOT NULL,   -- Monday 8am etc.
    
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    
    UNIQUE (CourseID, SessionDate)
);

CREATE TABLE AttendanceRecords (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID VARCHAR(10) NOT NULL,
    SessionID INT NOT NULL,
    Status VARCHAR(10) NOT NULL
        CHECK (Status IN ('Present', 'Absent', 'Late', 'Excused')),
        
    TimeRecorded  DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID),
    
    UNIQUE (StudentID, SessionID)
);

CREATE TABLE Temp_CourseTable (
    CourseCode VARCHAR(10) PRIMARY KEY,
    Section INT
);

ALTER TABLE Courses
MODIFY Section VARCHAR(5) NOT NULL;

ALTER TABLE Students
ADD SEmail VARCHAR(100) UNIQUE;

DROP TABLE Temp_CourseTable;

-- Tan Zhi Ming A23CS0189 B1-B2 + C1-C5 --
USE AttendanceSystemDB;

INSERT INTO Lecturers (LFirstName, LLastName, LEmail, Department) VALUES
('Ahmad','Rahim','ahmadrahim@utm.my','Languages'),
('Siti','Zaharah','sitizaharah@utm.m','Languages'),
('Lim','Wei Ming','limweiming@utm.m','Computer Science'),
('Tan','Jun Hao','tanjunhao@uutm.m','Computer Science'),
('Aisyah','Hamzah','aisyahhamzah@utm.m','Mathematics'),
('Gurmeet','Singh','gurmeetsingh@utm.m','Mathematics'),
('Farah','Husna','farahhusna@utm.m','Business'),
('Wong','Kai Lun','wongkailun@utm.m','Business'),
('Saravanan','Maniam','saravananmaniam@utm.m','Engineering'),
('Nurul','Aqilah','nurulaqilah@utm.m','Engineering');

INSERT INTO Students (StudentID, SFirstName, SLastName, SPhone, EnrollmentYear, Status, SEmail) VALUES
('S001', 'Tan','Zhiming','012-1111111',2023,'Active','tangzhiming@graduate.utm.my'),
('S002', 'Nadia','Syafiqah','012-2222222',2022,'Active','nadiasyafiqah@graduate.utm.my'),
('S003', 'Wei','Jie','012-3333333',2024, 'Active','weijie@graduate.utm.my'),
('S004', 'Chau','Yingjia','012-4444444',2021,'Active','chauyingjia@graduate.utm.my'),
('S005', 'Hafiz','Muzakir','012-5555555',2023,'Active','hafizmuzakir@graduate.utm.my'),
('S006', 'Ng','Yuhin','012-6666666',2022,'Active','ngyuhin@graduate.utm.my'),
('S007', 'Aisyah','Nabila','012-7777777',2023,'Active','aisyahnabila@graduate.utm.my'),
('S008', 'Yoges','Kumar','012-8888888',2024,'Active', 'yogeskumar@graduate.utm.my'),
('S009', 'Elijah','She','012-9999999',2021,'Active','elijahshe@graduate.utm.my'),
('S010', 'Firdaus','Rashid','012-0000000',2020,'Active','firdausrashid@graduate.utm.my');

INSERT INTO Courses (CourseID, CourseName, Credits, Semester, Section, LecturerID) VALUES
('FRN101', 'Bahasa Perancis I',         3, '2025S1', 'A1', 1),
('FRN201', 'Bahasa Perancis II',        3, '2025S1', 'B1', 2),
('CSC101', 'Asas Pengaturcaraan',       4, '2025S1', 'A1', 3),
('CSC201', 'Sistem Pangkalan Data',     4, '2025S1', 'B1', 4),
('MAT101', 'Kalkulus I',                3, '2025S1', 'A1', 5),
('MAT201', 'Algebra Linear',            3, '2025S1', 'B1', 6),
('BUS101', 'Prinsip Perniagaan',        3, '2025S1', 'A1', 7),
('BUS201', 'Asas Pemasaran',            3, '2025S1', 'B1', 8),
('ENG101', 'Mekanikal Kejuruteraan',    4, '2025S1', 'A1', 9),
('ENG201', 'Termodinamik',              4, '2025S1', 'B1',10);

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Status) VALUES
('S001', 'FRN101', '2025-02-01', 'Enrolled'),
('S002', 'FRN101', '2025-02-01', 'Enrolled'),
('S003', 'FRN101', '2025-02-02', 'Enrolled'),
('S004', 'CSC201', '2025-02-01', 'Enrolled'),
('S005', 'CSC201', '2025-02-01', 'Enrolled'),
('S006', 'MAT101', '2025-02-01', 'Enrolled'),
('S007', 'MAT101', '2025-02-03', 'Enrolled'),
('S008', 'BUS101', '2025-02-01', 'Enrolled'),
('S009', 'ENG101', '2025-02-02', 'Enrolled'),
('S010','ENG101', '2025-02-02', 'Enrolled');

INSERT INTO Sessions (CourseID, SessionDate) VALUES
('FRN101', '2025-03-03 08:00:00'),
('FRN101', '2025-03-10 08:00:00'),
('FRN101', '2025-03-17 08:00:00'),
('CSC201', '2025-03-03 10:00:00'),
('CSC201', '2025-03-10 10:00:00'),
('MAT101', '2025-03-04 09:00:00'),
('MAT101', '2025-03-11 09:00:00'),
('BUS101', '2025-03-05 14:00:00'),
('ENG101', '2025-03-06 11:00:00'),
('ENG101', '2025-03-13 11:00:00');

INSERT INTO AttendanceRecords (StudentID, SessionID, Status) VALUES
('S001', 1, 'Present'),
('S002', 1, 'Absent'),
('S003', 1, 'Late'),
('S001', 2, 'Present'),
('S002', 2, 'Present'),
('S003', 2, 'Excused'),
('S004', 4, 'Present'),
('S005', 4, 'Absent'),
('S006', 6, 'Present'),
('S007', 7, 'Late');

-- set student status to inactive if enrollment year <= 2021 --
UPDATE Students
SET Status = 'Inactive'
WHERE EnrollmentYear <= 2021;

-- Drop student (Hafiz Muzakir) enrollment from course (Sistem Pangkalan Data) --
UPDATE Enrollments
SET Status = 'Dropped'
WHERE StudentID = 'S005' AND CourseID = 'CSC201';

-- update lecturer ahmad rahim email --
UPDATE Lecturers
SET LEmail = 'ahmad.rahim@utm.my'
WHERE LFirstName = 'Ahmad' AND LLastName = 'Rahim';

-- delete student with excused from attendance records --
DELETE FROM AttendanceRecords
WHERE Status = 'Excused';

-- remove Prinsip Perniagaan from session at 5/3/2925 2pm --
DELETE FROM Sessions
WHERE CourseID = 'BUS101'
  AND SessionDate = '2025-03-05 14:00:00';

-- Remove student firdaus enrollment for course Mekanikal Kejuruteraan from table enrollments --
DELETE FROM Enrollments
WHERE StudentID = 'S010'
  AND CourseID = 'ENG101';
  
SELECT LFirstName, LLastName, LEmail
FROM Lecturers
WHERE Department = 'Mathematics'
  AND LEmail IS NOT NULL;


-- Part c --
-- filtering --
SELECT StudentID, SFirstName, SLastName, EnrollmentYear
FROM Students
WHERE EnrollmentYear BETWEEN 2021 AND 2024
  AND Status = 'Active';

SELECT CourseID, CourseName
FROM Courses
WHERE CourseName LIKE '%Bahasa%' 
   OR CourseName LIKE '%Pemasaran%';
   
-- sorting --
SELECT StudentID, SFirstName, EnrollmentYear
FROM Students
ORDER BY EnrollmentYear ASC;

SELECT CourseID, CourseName, Credits
FROM Courses
ORDER BY Credits DESC
LIMIT 5;


-- aggregation --
SELECT COUNT(*) AS TotalStudents
FROM Students;

SELECT 
    AVG(Credits) AS AvgCredits,
    MAX(Credits) AS MaxCredits,
    MIN(Credits) AS MinCredits
FROM Courses;

SELECT 
    e.StudentID,
    SUM(c.Credits) AS TotalCredits
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY e.StudentID;


-- grouping --
SELECT CourseID, COUNT(*) AS TotalSessions
FROM Sessions
GROUP BY CourseID
HAVING COUNT(*) >= 2;

SELECT 
    StudentID,
    COUNT(*) AS TotalRecords,
    SUM(Status = 'Present') AS PresentCount
FROM AttendanceRecords
GROUP BY StudentID
HAVING SUM(Status = 'Present') >= 1;


-- numeric and string function --
SELECT 
    StudentID,
    UPPER(CONCAT(SFirstName, ' ', SLastName)) AS FullNameUpper,
    SUBSTR(SFirstName, 1, 3) AS FirstThreeLetters
FROM Students;


SELECT 
    CourseID,
    Credits,
    ROUND(Credits / 3, 2) AS RoundedValue,
    TRUNCATE(Credits / 3, 1) AS TruncatedValue
FROM Courses;

SELECT 
    StudentID,
    SFirstName,
    LENGTH(SFirstName) AS FirstNameLength
FROM Students;

-- NG YU HIN A23CS0148 C6-C9

-- case when
-- Count present/late/absent 
-- and classify attendance performance
SELECT StudentID,
	COUNT(*) AS TotalSessions,
    SUM(Status = 'Present') AS present_count,
    SUM(Status = 'Late') AS late_count,
    SUM(Status = 'Absent') AS absent_count,
    CASE 
		WHEN SUM(Status = 'Present') / COUNT(*) >= 0.8 THEN 'Good Attendance'
		WHEN SUM(Status = 'Absent') >= 2 THEN 'Poor Attendance'
		ELSE 'Average Attendance'
	END AS AttendanceStatus
FROM AttendanceRecords
GROUP BY StudentID;

-- single row subquery
-- students enrolled before the earliest enrollment date in the system
SELECT StudentID, CourseID
FROM Enrollments
WHERE EnrollmentDate = (
    SELECT MIN(EnrollmentDate)
    FROM Enrollments
);

-- multi row subquery
-- list lecturers teaching courses that is more than 1 session
SELECT LecturerID, LFirstName, LLastName
FROM Lecturers
WHERE LecturerID IN (
    SELECT LecturerID
    FROM Courses c
    JOIN Sessions s ON c.CourseID = s.CourseID
    GROUP BY LecturerID
    HAVING COUNT(*) > 1
);

-- correlated subquery
-- list students with more present records 
-- than average present counts
SELECT StudentID
FROM AttendanceRecords a1
GROUP BY StudentID
HAVING SUM(Status='Present') >
(
    SELECT AVG(PresentCount)
    FROM (
        SELECT SUM(Status='Present') AS PresentCount
        FROM AttendanceRecords
        GROUP BY StudentID
    ) AS temp_table
);

-- set operations 
-- i. Union
-- list all people in the system
SELECT SFirstName AS FirstName, SLastName AS LastName, 'Student' AS Role
FROM Students
UNION
SELECT LFirstName, LLastName, 'Lecturer'
FROM Lecturers;

-- ii. Not Exists
-- find students enrolled in a course 
-- but have no attendance records yet
SELECT e.StudentID, e.CourseID
FROM Enrollments e
WHERE NOT EXISTS (
    SELECT 1
    FROM AttendanceRecords a
    WHERE a.StudentID = e.StudentID
      AND a.SessionID IN (
          SELECT SessionID FROM Sessions WHERE CourseID = e.CourseID
      )
);

-- joins
-- natural joins
-- list of student enrollments 
SELECT StudentID, CourseID, EnrollmentDate
FROM (
    SELECT StudentID, CourseID, EnrollmentDate, Status AS EnrollStatus
    FROM Enrollments
) AS e
NATURAL JOIN Students;

-- inner join
-- list all student enrollments with course id
SELECT 
	e.StudentID,
    s.SFirstName,
    e.CourseID,
    c.CourseName
FROM Enrollments e
INNER JOIN Students s ON e.StudentID = s.StudentID
INNER JOIN Courses c  ON e.CourseID = c.CourseID;	

-- left outer join
-- all courses and show how many students enrolled
SELECT 
    c.CourseID,
    c.CourseName,
    COUNT(e.StudentID) AS TotalStudents
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID;


-- self join
-- students from the same enrollment year
SELECT 
    s1.StudentID AS Student1,
    s2.StudentID AS Student2,
    s1.EnrollmentYear
FROM Students s1
JOIN Students s2 
    ON s1.EnrollmentYear = s2.EnrollmentYear
    AND s1.StudentID < s2.StudentID;
    
-- ============================================================
-- BTREE INDEX TEST (BEFORE & AFTER)
-- ============================================================

-- BEFORE BTREE INDEX
EXPLAIN SELECT *
FROM Enrollments 
WHERE EnrollmentDate BETWEEN '2025-02-03' AND '2025-03-02';

-- CREATE BTREE INDEX
CREATE INDEX idx_enrollment_date ON Enrollments (EnrollmentDate);

-- AFTER BTREE INDEX
EXPLAIN SELECT *
FROM Enrollments 
WHERE EnrollmentDate BETWEEN '2025-02-03' AND '2025-03-02';

-- DROP BTREE INDEX (Correct Name)
DROP INDEX idx_enrollment_date ON Enrollments;



-- ============================================================
-- FULLTEXT INDEX TEST (BEFORE & AFTER)
-- ============================================================

-- BEFORE FULLTEXT INDEX
EXPLAIN SELECT *
FROM Students
WHERE SFirstName LIKE '%Aisyah%'
   OR SLastName LIKE '%Aisyah%';

-- CREATE FULLTEXT INDEX
ALTER TABLE Students
ADD FULLTEXT idx_student_name (SFirstName, SLastName);

-- AFTER FULLTEXT INDEX
EXPLAIN SELECT *
FROM Students
WHERE MATCH(SFirstName, SLastName) AGAINST ('Aisyah');

-- DROP FULLTEXT INDEX
ALTER TABLE Students DROP INDEX idx_student_name;