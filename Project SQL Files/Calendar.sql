CREATE DATABASE if not exists projectdb;
USE projectdb;

DELIMITER $$
CREATE PROCEDURE create_user_if_not_exists()
BEGIN
    IF NOT EXISTS(SELECT * FROM mysql.user WHERE user = 'project_user' AND host = 'localhost')
    THEN
        CREATE USER 'project_user'@'localhost' IDENTIFIED BY 'password';
    END IF;
END$$
DELIMITER ;

CALL create_user_if_not_exists();

GRANT ALL PRIVILEGES ON projectdb.* TO 'project_user'@localhost;
CREATE TABLE Calendar (CalID INT Primary Key,CourseID INT,Event_Name VARCHAR(70),StartDate date,EndDate date,description VARCHAR(70),FOREIGN KEY(CourseID
) REFERENCES Courses(CourseID));