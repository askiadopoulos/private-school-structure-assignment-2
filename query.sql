-- A list of all the students
SELECT *
FROM Student

-- A list of all the trainers
SELECT *
FROM Trainer

-- A list of all the assignments
SELECT *
FROM Assignment

-- A list of all the courses
SELECT *
FROM Course


-- All the Students per Course
SELECT S.ID AS StudentID, S.FName AS First_Name, S.LName AS LastName,
C.ID AS CourseID, C.Title AS Course_Title, C.Stream AS Course_Stream,
C.Type AS Course_Type
FROM Student S, Course C, StudentPerCourse SPC
WHERE S.ID = SPC.StudentID AND C.ID = SPC.CourseID
ORDER BY C.Title, S.FName

-- All the Students per Course (using JOIN)
SELECT S.ID AS StudentID, S.FName AS First_Name, S.LName AS LastName,
C.ID AS CourseID, C.Title AS Course_Title, C.Stream AS Course_Stream,
C.Type AS Course_Type
FROM Student S
JOIN StudentPerCourse SPC
ON S.ID = SPC.StudentID
JOIN Course C
ON C.ID = SPC.CourseID
ORDER BY C.Title, S.FName


-- All the Trainers per Course
SELECT T.ID AS TrainerID, T.FName AS First_Name, T.LName AS LastName,
C.ID AS CourseID, C.Title AS Course_Title, C.Stream AS Course_Stream,
C.Type AS Course_Type
FROM Trainer T, Course C
WHERE T.ID = C.TrainerID
ORDER BY T.ID

-- All the Trainers per Course (using JOIN)
SELECT T.ID AS TrainerID, T.FName AS First_Name, T.LName AS LastName,
C.ID AS CourseID, C.Title AS Course_Title, C.Stream AS Course_Stream,
C.Type AS Course_Type
FROM Trainer T
JOIN Course C
ON T.ID = C.TrainerID
ORDER BY T.ID


-- All the Assignments per Course
SELECT A.ID AS AssignmentID, A.Title AS Title, A.Description AS Description,
C.ID AS CourseID, C.Title AS Course_Title, C.Stream AS Course_Stream,
C.Type AS Course_Type
FROM Assignment A, Course C, AssignmentPerCourse APC
WHERE A.ID = APC.AssignmentID AND C.ID = APC.CourseID
ORDER BY C.ID

-- All the Assignments per Course (using JOIN)
SELECT A.ID AS AssignmentID, A.Title AS Title, A.Description AS Description,
C.ID AS CourseID, C.Title AS Course_Title, C.Stream AS Course_Stream,
C.Type AS Course_Type
FROM Assignment A
JOIN AssignmentPerCourse APC
ON A.ID = APC.AssignmentID
JOIN Course C
ON C.ID = APC.CourseID
ORDER BY C.ID


-- All the Assignments per Course per Student
SELECT A.ID AS AssignmentID, A.Title AS Title, A.Description AS Description,
C.ID AS CourseID, C.Title AS Course_Title, C.Stream AS Course_Stream,
C.Type AS Course_Type, S.ID AS StudentID, S.FName AS FirstName, S.LName AS LastName
FROM Assignment A, Course C, Student S, AssignmentPerCourse APC, StudentPerCourse SPC
WHERE A.ID = APC.AssignmentID AND C.ID = APC.CourseID
AND S.ID = SPC.StudentID AND C.ID = SPC.CourseID
ORDER BY A.ID

-- All the Assignments per Course per Student (using JOIN)
SELECT A.ID AS AssignmentID, A.Title AS Title, A.Description AS Description,
C.ID AS CourseID, C.Title AS Course_Title, C.Stream AS Course_Stream,
C.Type AS Course_Type, S.ID AS StudentID, S.FName AS FirstName, S.LName AS LastName
FROM Assignment A
JOIN AssignmentPerCourse APC
ON A.ID = APC.AssignmentID
JOIN Course C
ON C.ID = APC.CourseID
JOIN StudentPerCourse SPC
ON SPC.CourseID = C.ID
JOIN Student S
ON S.ID = SPC.StudentID
ORDER BY A.ID


-- A list of Students that belong to more than one Courses
SELECT S.ID AS StudentID, S.FName AS FirstName, S.LName AS LastName,
COUNT(*) AS NumberOfCourses
FROM Student S, StudentPerCourse SPC, Course C
WHERE S.ID = SPC.StudentID
AND C.ID = SPC.CourseID
GROUP BY S.ID, S.FName, S.LName
HAVING COUNT(*) > 1

-- A list of Students that belong to more than one Courses (using JOIN)
SELECT S.ID AS StudentID, S.FName AS FirstName, S.LName AS LastName,
COUNT(*) AS NumberOfCourses
FROM Student S
JOIN StudentPerCourse SPC
ON S.ID = SPC.StudentID
JOIN Course C
ON C.ID = SPC.CourseID
GROUP BY S.ID, S.FName, S.LName
HAVING COUNT(*) > 1
