 CREATE DATABASE if not exists projectdb;

use projectdb;
CREATE USER if not exists project_user@localhost;

GRANT ALL PRIVILEGES ON projectdb.* TO 'project_user'@localhost;

DROP TABLE IF EXISTS Admins;
CREATE TABLE Admins (AID INT PRIMARY KEY,name VARCHAR(55), password VARCHAR(55));
INSERT INTO Admins (AID,name,password ) VALUES(620221, 'Mr. Benjamin Morris MD','Z@0GqU3Vgp');
INSERT INTO Admins (AID,name,password ) VALUES(620209, 'Yolanda Jimenez','(bHGhlq76H');
INSERT INTO Admins (AID,name,password ) VALUES(620127, 'Michael Gray','^6eSciS70j');
INSERT INTO Admins (AID,name,password ) VALUES(620292, 'Danielle Wood','u@!PXDmK_4');
INSERT INTO Admins (AID,name,password ) VALUES(620229, 'David Fuller','@SC(Crsz7l');
INSERT INTO Admins (AID,name,password ) VALUES(620241, 'Barbara Ramos','4p^4$7QhfS');
INSERT INTO Admins (AID,name,password ) VALUES(620225, 'Paul Morris','s%994OXa3*');
INSERT INTO Admins (AID,name,password ) VALUES(620201, 'Carl Carney','_L2PAxnL9)');
INSERT INTO Admins (AID,name,password ) VALUES(620157, 'Jeffrey Crosby','@jZ4!FQj*K');
INSERT INTO Admins (AID,name,password ) VALUES(620265, 'Barbara Brown','1yW*vJ+L(B');
INSERT INTO Admins (AID,name,password ) VALUES(620231, 'Martin Brown','#tPTquYgF3');
INSERT INTO Admins (AID,name,password ) VALUES(620248, 'Leonard Perkins','EF3SD+r+)G');
INSERT INTO Admins (AID,name,password ) VALUES(620107, 'Tammy Silva','&0OEu1$i&F');
INSERT INTO Admins (AID,name,password ) VALUES(620167, 'Jennifer Downs','+5#9E!NkSp');
INSERT INTO Admins (AID,name,password ) VALUES(620211, 'Joshua Castillo',')56USzS61y');
INSERT INTO Admins (AID,name,password ) VALUES(620158, 'Michael Arellano','yJ&mY7HezX');
INSERT INTO Admins (AID,name,password ) VALUES(620222, 'Andrea Khan','C$3HHyVJN1');
INSERT INTO Admins (AID,name,password ) VALUES(620210, 'Emily Nguyen','6z5iYiptR$');
INSERT INTO Admins (AID,name,password ) VALUES(620250, 'Allison Martin','v2!MHSWn_*');
INSERT INTO Admins (AID,name,password ) VALUES(620186, 'Jerry Herrera',')xoZcSGIc1');

INSERT INTO Admins(AID, name, password) VALUES(620868,'Steven Grant','ugd(NH02H');

SELECT * FROM Admins WHERE AID = 620868;