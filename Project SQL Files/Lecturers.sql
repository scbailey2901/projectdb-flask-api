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
DROP TABLE IF EXISTS Lecturers;
CREATE TABLE Lecturers (LID INT PRIMARY KEY, Password VARCHAR(55),name VARCHAR(255), department VARCHAR(60));
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254875, 'mBWD2nq9_5', 'Hannah Rivera','Department of Information Technology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620252606, '02vM2Mcn@d', 'Elizabeth James','Department of Public Health');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620255155, '(H#5CSj4p8', 'Patrick Shields','Department of Anthropology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254514, 'N65QtZz7^V', 'Robert Salazar','Department of Computer Science');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620255901, '#UU7WdiLL$', 'Sandra Church','Department of Political Science');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620252784, '(IdYIegJh2', 'Edwin Richardson','Department of Biology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254471, '^lPb2Wb^^9', 'Vanessa Garcia','Department of Graphic Design');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620259492, 'Ll#RANLy_7', 'Sandra Preston','Department of Graphic Design');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620251973, 'dnf^9IOnQr', 'Jennifer Martin','Department of Finance');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254564, '&3_FulD79k', 'Jeremy Thomas','Department of Graphic Design');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250181, 'S@FaRn$q!5', 'James Williamson','Department of Art');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254938, '%C0LcjVvll', 'Michelle Palmer','Department of Chemistry');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620251987, 'f6zUX$Sp!L', 'Zachary Garza','Department of History');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258020, '+qMP@bsR6*', 'Alexander Anderson','Department of Communications');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620257733, '_MQF9HJq&b', 'Michael Richmond','Department of International Relations');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258599, '(a9IRSba3z', 'Julie Poole','Department of Sociology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620256430, '#60QrVPJf&', 'Dr. Samantha Greene DDS','Department of Art');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620257052, '3L(8wzZzEL', 'Kimberly Rice','Department of Sociology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258946, 'q8jCzL$U_M', 'Lisa Bond','Department of Journalism');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620255755, '&OY3WWi+zh', 'Hannah Bauer','Department of Communications');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250274, '1M_7HbS7dx', 'Matthew Johnson','Department of Political Science');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620257983, 'l0ds5BMgg%', 'Gary Brewer','Department of English');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620251653, 'mK%!8NUwT*', 'Kelly Gilbert','Department of Graphic Design');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254309, '2qtIX1hR_Y', 'Jocelyn Hahn','Department of Education');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258177, 'qOJJ29Dr)(', 'Joan Davis','Department of Music');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620251239, '_M671QUdZG', 'Jeffery Martinez','Department of Information Technology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620252325, '&fvPUhG&u4', 'Hannah Mccormick','Department of Public Health');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620259185, 'I01zSxdE_(', 'Victoria Cherry MD','Department of Political Science');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620259319, 'pKE4^6Dq+6', 'Katie Jordan','Department of Finance');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254796, '(I0S+(ma)W', 'Zachary Carlson','Department of Economics');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250107, 'Y&t3pDGJKi', 'Joe Bailey','Department of Civil Engineering');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258648, '#$0Hgkm3(v', 'Anthony Snyder','Department of Criminal Justice');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620256746, '19DPmw6)$L', 'Timothy Richards','Department of Chemistry');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250818, '^2PSiurb$s', 'James Camacho','Department of Mechanical Engineering');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250489, 'Q@HC8FQQ4w', 'Amy Green','Department of Chemistry');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258154, '@7_Ra_FVeo', 'Lori Crawford','Department of Marketing');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620256442, '_Xr9XE_fF0', 'Erik Garcia','Department of Music');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620253091, 'v5#@Y9Lyn+', 'Richard Simmons','Department of Mechanical Engineering');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250787, 'f#ZZlXaK^2', 'Nicole Harper','Department of History');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254154, 'F#cV98^xzX', 'Amy Ferguson','Department of Environmental Science');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620257904, '8QyoA(mn(p', 'Breanna Wiley','Department of Business Administration');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620256561, '9J#5UInZVD', 'Isabella Alvarez','Department of Environmental Science');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258951, 'DB_58ETe!f', 'Kelly Conrad','Department of Music');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620257018, '(CD1YnF3^U', 'Ronnie Harris','Department of Anthropology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254778, '&KyG^#d94q', 'Victoria Powell','Department of Economics');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258237, '^s$%k6Aq74', 'Rebecca Mason','Department of Theater');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250460, 'cj9Ki2sa0%', 'Kimberly Hill','Department of Theater');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254716, '4slut0Hy(X', 'Ashley Dominguez','Department of Graphic Design');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258653, 'O68KOhgh%3', 'Cristina Harrison','Department of Education');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258082, ')FPQMl4m*5', 'Amy Adams','Department of Psychology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250786, '*3MAKf&bpY', 'Nancy Mcdowell','Department of Mathematics');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620256025, '#cNsE_op9Z', 'Susan Murray','Department of Marketing');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250966, 'W*8K)5VaMZ', 'Elizabeth Smith','Department of Electrical Engineering');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620256709, 'D6Mgh)xP!0', 'Karen Gonzalez','Department of Information Technology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620253044, 'xEImQ3Ep!8', 'David Stevens','Department of Music');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620259065, 'K7)&2TLf!Q', 'Sean Sawyer','Department of Philosophy');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258158, '!b4gT$SaT8', 'Pamela Russell MD','Department of Finance');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250124, '$G3L86cI&*', 'Danielle Hansen','Department of Communications');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620253076, 'UPe*82Bu4+', 'Roberta Brock','Department of Political Science');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620252049, 'B45QEGjj%f', 'Sharon Brown','Department of Journalism');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620252875, 'e$4IxN6M2i', 'Mark Clarke','Department of International Relations');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620255056, '^T6D6sNoLl', 'Robert Reed','Department of Sociology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254128, '%2WLbSC(z&', 'Edward Hill','Department of Philosophy');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620259089, 'l)_6wA9yby', 'Jeff King','Department of Sports Management');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254784, 'l+3jR3aF$G', 'Roy Beck','Department of Criminal Justice');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620257356, 'TC4AuKTd)(', 'Timothy Howard','Department of Biology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254270, '_Cpf9ZzBU6', 'Sheila Ingram','Department of Biology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250434, '%4+Mbcy0r1', 'Amanda Thompson','Department of Sociology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620258773, 'Tr&YCteC(4', 'Alice Lambert','Department of Environmental Science');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620252553, '@9wTZWrXvu', 'Adam White','Department of Philosophy');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250554, 'a8Xt+UO7%X', 'Ashley Rodriguez','Department of Art');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254519, '^om6dEUm@S', 'James Morris','Department of Electrical Engineering');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250691, '_N05GMOb23', 'Anthony Owens','Department of Information Technology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620257612, '!qE4EfP06t', 'Deborah Burns','Department of Marketing');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620251519, 'Lh#7U$ZxcP', 'Lindsey Soto','Department of English');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620257772, '(6CnLHsnch', 'Lisa Scott','Department of Philosophy');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620255174, '&43aBLotGO', 'Heather Williams','Department of Sports Management');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620251964, 'M&%%88SxEb', 'Wayne Duncan','Department of Graphic Design');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620253484, 'k+71Rt*coR', 'Tyler Long MD','Department of International Relations');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250573, ')syzZsW@65', 'Carrie Edwards','Department of Sociology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254871, ')fH3ACsX60', 'Ms. Debra Kent MD','Department of Marketing');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620253138, '$$0WQJovBx', 'Christopher Smith','Department of Marketing');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620253593, 't40KVy93B)', 'Gregory Baker','Department of Human Resource Management');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620256327, 'c*gY9Q*TWn', 'Ashley Stewart','Department of Sports Management');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620256316, '!8m9YvBuKk', 'Lisa Williams','Department of Nursing');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254390, 'b)9X2hVmQ+', 'Michael Mcfarland','Department of Business Administration');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620252330, '^LFh5AHx3J', 'Kevin Dixon','Department of Finance');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620256146, 'L@g2IeYcHC', 'Steven Sawyer','Department of Information Technology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620250175, 'VEU6Ly%p+i', 'Frederick Hess','Department of Biology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620257097, 'W^7xCyHwa4', 'Craig Martinez','Department of Chemistry');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620253734, '6VAO1vT%#J', 'Chelsea Bowman','Department of Nursing');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620257568, '@W81bZm_k+', 'Hector Gillespie','Department of Electrical Engineering');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620254465, '(FXkwkxu7u', 'Richard Cole','Department of Civil Engineering');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620251763, '#!29RqgYo+', 'Douglas York','Department of Finance');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620259419, '@VEh3XpzA!', 'David Lee','Department of Computer Science');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620256682, 'Uo74VBxf(#', 'Joseph Collins','Department of Sports Management');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620255654, '9nv@SXZb*j', 'Christopher Jones','Department of Anthropology');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620255692, '+(IGy@wd80', 'Richard Jackson','Department of Public Health');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620259714, '8%6P2LtlGT', 'Margaret Woods','Department of Education');
INSERT INTO Lecturers (LID,password,name,department ) VALUES(620257224, '&R3nT0ooyk', 'Karla Reid','Department of Civil Engineering');

SELECT * FROM Lecturers WHERE LID = 620257224;
select * from Lecturers;

INSERT INTO Lecturers(LID, password,name, department) VALUES(620268990,'%hhk790JHj0','Steven Grant','Department of History');

SELECT * FROM Lectures WHERE LID=620250107;