CREATE DATABASE if not exists projectdb;
USE projectdb;
CREATE USER if not exists project_user@localhost;

GRANT ALL PRIVILEGES ON projectdb.* TO 'project_user'@localhost;
CREATE TABLE Calendar (CalID INT Primary Key,CourseID INT,Event_Name VARCHAR(70),StartDate date,EndDate date,description VARCHAR(70),FOREIGN KEY(CourseID
) REFERENCES Courses(CourseID));