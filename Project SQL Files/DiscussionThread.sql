CREATE DATABASE if not exists projectdb;
USE projectdb;
CREATE USER if not exists project_user@localhost;

GRANT ALL PRIVILEGES ON projectdb.* TO 'project_user'@localhost;
CREATE TABLE DiscussionThread (ThreadID INT Primary Key,DFID INT,Subject
VARCHAR(70),Comment VARCHAR(70),Contributor VARCHAR(70),FOREIGN KEY(DFID) REFERENCES DiscussionForum(DFID));