CREATE DATABASE if not exists projectdb;
USE projectdb;
CREATE USER if not exists project_user@localhost;

GRANT ALL PRIVILEGES ON projectdb.* TO 'project_user'@localhost;
 CREATE TABLE Sections (SecNo INT Primary Key,CourseID INT,Title VARCHAR(70),RESOURCE VARCHAR(70),FOREIGN KEY(CourseID) REFERENCES Courses(CourseID));