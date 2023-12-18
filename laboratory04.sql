CREATE TABLE STUDENT (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(25)
);

INSERT INTO STUDENT (StudentID, StudentName)
VALUES
    (38214, 'Latersky'),
    (54907, 'Altvater'),
    (66324, 'Aiken'),
    (70542, 'Marra');

CREATE TABLE QUALIFIED (
    FacultyID INT,
    CourseID VARCHAR(8),
    DateQualified DATE
);

INSERT INTO QUALIFIED (FacultyID, CourseID, DateQualified)
VALUES
    (2143, 'ISM 3112', '2008-09-01'),
    (2143, 'ISM 3113', '2008-09-01'),
    (3467, 'ISM 4212', '2015-09-01'),
    (3467, 'ISM 4930', '2016-09-01'),
    (4756, 'ISM 3113', '2011-09-01'),
    (4756, 'ISM 3112', '2011-09-01');

CREATE TABLE FACULTY (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(25)
);

INSERT INTO FACULTY (FacultyID, FacultyName)
VALUES
    (2143, 'Birkin'),
    (3467, 'Berndt'),
    (4756, 'Collins');

CREATE TABLE SECTION (
    SectionNo INT PRIMARY KEY,
    Semester VARCHAR(7),
    CourseID VARCHAR(8)
);

INSERT INTO SECTION (SectionNo, Semester, CourseID)
VALUES
    (2712, 'I-2018', 'ISM 3113'),
    (2713, 'I-2018', 'ISM 3113'),
    (2714, 'II-2018', 'ISM 4212'),
    (2715, 'II-2018', 'ISM 4930');

CREATE TABLE COURSE (
    CourseID VARCHAR(8) PRIMARY KEY,
    CourseName VARCHAR(15)
);

INSERT INTO COURSE (CourseID, CourseName)
VALUES
    ('ISM 3113', 'Syst Analysis'),
    ('ISM 3112', 'Syst Design'),
    ('ISM 4212', 'Database'),
    ('ISM 4930', 'Networking');

CREATE TABLE REGISTRATION (
    StudentID INT,
    SectionNo INT
);

INSERT INTO REGISTRATION (StudentID, SectionNo)
VALUES
    (38214, 2714),
    (54907, 2714),
    (54907, 2715),
    (66324, 2713);

ALTER TABLE STUDENT
ADD Class VARCHAR(10);

DROP TABLE REGISTRATION;

ALTER TABLE FACULTY
ALTER COLUMN FacultyName VARCHAR(40);


SELECT SectionNo
FROM SECTION
WHERE CourseID = 'ISM 3113' AND Semester = 'I-2018';

SELECT CourseID, CourseName
FROM COURSE
WHERE CourseName LIKE 'Data%';

SELECT DISTINCT q.FacultyID
FROM QUALIFIED q
WHERE q.CourseID IN ('ISM 3112', 'ISM 3113')
GROUP BY q.FacultyID
HAVING COUNT(DISTINCT q.CourseID) = 2;

SELECT DISTINCT q.FacultyID
FROM QUALIFIED q
WHERE q.CourseID IN ('ISM 3112', 'ISM 3113')
AND YEAR(q.DateQualified) > 2011
GROUP BY q.FacultyID
HAVING COUNT(DISTINCT q.CourseID) = 2;

SELECT s.FacultyID
FROM SECTION s
WHERE s.CourseID = 'ISM 4212' AND s.Semester = 'II-2018';
