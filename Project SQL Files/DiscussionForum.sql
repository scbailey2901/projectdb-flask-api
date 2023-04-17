CREATE DATABASE if not exists projectdb;
USE projectdb;
CREATE USER f not existsproject_user@localhost;

GRANT ALL PRIVILEGES ON projectdb.* TO 'project_user'@localhost;
CREATE TABLE DiscussionForum (DFID INT Primary Key,CourseID INT,Topic VARCHAR(70),FOREIGN KEY(CourseID) REFERENCES Courses(CourseID));