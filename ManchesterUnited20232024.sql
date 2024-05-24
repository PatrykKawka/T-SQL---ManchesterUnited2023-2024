CREATE DATABASE ManchesterUnited20232024;
---
USE ManchesterUnited20232024;
---
CREATE PROCEDURE dbo.ManchesterUnited
AS
BEGIN

CREATE TABLE tbl_Positions (
PositionID TINYINT IDENTITY(1,1) PRIMARY KEY,
Position NVARCHAR(32) NOT NULL UNIQUE
);

CREATE TABLE tbl_Nationalities (
NationalityID TINYINT IDENTITY(1,1) PRIMARY KEY,
Nationality NVARCHAR(32) UNIQUE NOT NULL
);

CREATE TABLE tbl_Players (
PlayerID TINYINT IDENTITY(1,1) PRIMARY KEY,
Number TINYINT NOT NULL UNIQUE ,
Position TINYINT NOT NULL REFERENCES tbl_Positions(PositionID) ON UPDATE CASCADE,
Nationality TINYINT NOT NULL REFERENCES tbl_Nationalities(NationalityID) ON UPDATE CASCADE
);

CREATE TABLE tbl_PlayersName (
PlayerID TINYINT PRIMARY KEY,
FirstName NVARCHAR(32),
LastName NVARCHAR(32) NOT NULL,
FOREIGN KEY (PlayerID) REFERENCES tbl_Players(PlayerID) ON UPDATE CASCADE
);

CREATE TABLE tbl_Contracts
(ContractID TINYINT IDENTITY(1,1) PRIMARY KEY,
PlayerID TINYINT,
[ExpireDate] date  NULL,
FOREIGN KEY (PlayerID) REFERENCES tbl_Players(PlayerID) ON UPDATE CASCADE
);

CREATE TABLE tbl_PlayersStatistics
(PlayerID TINYINT PRIMARY KEY,
Games TINYINT NOT NULL,
Goals TINYINT NOT NULL,
Assists TINYINT NOT NULL,
[Minutes] smallint NOT NULL,
YellowCards TINYINT NOT NULL,
RedCards TINYINT NULL,
FOREIGN KEY (PlayerID) REFERENCES tbl_Players(PlayerID)  ON UPDATE CASCADE
);

CREATE TABLE tbl_MarketValue
(PlayerID TINYINT PRIMARY KEY,
MarketValue decimal(4,2) NOT NULL,
FOREIGN KEY (PlayerID) REFERENCES tbl_Players(PlayerID)  ON UPDATE CASCADE
);
---

INSERT INTO tbl_Positions(Position)
VALUES
('Goalkeeper'),
('Cenre-back'),
('Left-back'),
('Right-back'),
('Defensive midfield'),
('Central midfield'),
('Attacking midfield'),
('Left winger'),
('Right winger'),
('Centre-forward');

INSERT INTO tbl_Nationalities(Nationality)
VALUES
('England'),
('Cameroon'),
('Turkiye'),
('Argentina'),
('France'),
('Sweden'),
('Portugal'),
('Brazil'),
('Morocco'),
('Scotland'),
('Denmark'),
('Cote d Ivoire'),
('North Ireland'),
('Netherland'),
('Uruguay'),
('Spain');

INSERT INTO tbl_Players(Number, Position,Nationality)
VALUES
('24','1','2'),
('1','1','3'),
('22','1', '1'),
('6','2','4'),
('19','2','5'),
('9','10','5'),
('11','10','11'),
('21','8','11'),
('17','7','4'),
('18','5','11'),
('10','8','1'),
('7','7','1'),
('8','7','7'),
('5','2','1'),
('2','2','6'),
('35','2','13'),
('53','2','5'),
('23','3','1'),
('12','3','14'),
('20','4','7'),
('29','4','1'),
('4','5','9'),
('39','5','10'),
('37','6','1'),
('47','7','1'),
('16','10','12');

INSERT INTO tbl_PlayersName (PlayerID,FirstName, LastName)
VALUES
('1','Andre','Onana'),
('2','Altay','Baindir'),
('3','Tom','Heaton'),
('4','Lisandro','Martinez'),
('5','Raphael','Varane'),
('6','Anthony','Martial'),
('7','Rasmus','Hojlund'),
('8',NULL,'Antony'),
('9','Alejandro','Garnacho'),
('10',NULL, 'Casemiro'),
('11','Marcus','Rashford'),
('12','Mason','Mount'),
('13','Bruno','Fernandes'),
('14','Harry','Maguire'),
('15','Victor','Lindelof'),
('16','Johny','Evans'),
('17','Willy','Kambwala'),
('18','Luke','Shaw'),
('19','Tyrell','Malacia'),
('20','Diogo','Dalot'),
('21','Aaron','Wan-Bissaka'),
('22','Sofyan','Amrabat'),
('23','Scott','McTominay'),
('24','Kobbie','Mainoo'),
('25','Shola','Sholetire'),
('26','Amad','Diallo');

INSERT INTO tbl_Contracts(PlayerID, [ExpireDate])
VALUES
('1','2028-06-30'),
('2','2027-06-30'),
('3','2024-06-30'),
('4','2027-06-30'),
('5','2025-06-30'),
('6','2024-06-30'),
('7','2028-06-30'),
('8','2027-06-30'),
('9','2028-06-30'),
('10','2026-06-30'),
('11','2028-06-30'),
('12','2028-06-30'),
('13','2026-06-30'),
('14','2025-06-30'),
('15','2025-06-30'),
('16','2024-06-30'),
('17','2025-06-30'),
('18','2027-06-30'),
('19','2026-06-30'),
('20','2028-06-30'),
('21','2025-06-30'),
('22','2024-06-30'),
('23','2025-06-30'),
('24','2027-06-30'),
('25',NULL),
('26','2025-06-30');


-- Statistics 2024/05/24
INSERT INTO tbl_PlayersStatistics (PlayerID,Games,Goals, Assists, [Minutes], YellowCards, RedCards)
VALUES

('1','50', '0', '0', '4560', '6','0'),
('2','5', '0', '0', '450', '0' ,'0'),
('3','0', '0', '0', '0', '0' ,'0'),
('4','13', '0', '1', '827', '4' ,'0'),
('5','31', '1', '0', '2121', '2' ,'0'),
('6','19', '2', '1', '629', '0' ,'0'),
('7','42', '16', '2', '3072', '2' ,'0'),
('8','38', '3', '2', '1910', '4' ,'0'),
('9','49', '9', '5', '3484', '4' ,'0'),
('10','32', '5', '3', '2578', '6' ,'1'),
('11','42', '8', '5', '2983', '2' ,'0'),
('12','19', '1', '1', '755', '1' ,'0'),
('13','47', '15', '12', '4195', '10' ,'0'),
('14','31', '4', '2', '2310', '4' ,'0'),
('15','27', '1', '1', '1959', '3' ,'0'),
('16','29', '0', '1', '1583', '2' ,'0'),
('17','27', '0', '0', '1716', '4' ,'0'),
('18','15', '0', '1', '1180', '7' ,'0'),
('19','0', '0', '0', '0', '0' ,'0'),
('20','49', '3', '5', '4274', '5' ,'1'),
('21','29', '0', '3', '2321', '5' ,'0'),
('22','29', '0', '0', '1455', '6' ,'0'),
('23','42', '10', '3', '2685', '2' ,'0'),
('24','34', '4', '3', '2540', '3' ,'0'),
('25','3', '2', '0', '270', '2' ,'0'),
('26','12', '2', '1', '470', '0' ,'0');


INSERT INTO tbl_MarketValue(PlayerID,MarketValue)
VALUES
('1','40'),
('2','10'),
('3','0.25'),
('4','50'),
('5','25'),
('6','15'),
('7','65'),
('8','35'),
('9','30'),
('10','30'),
('11','70'),
('12','45'),
('13','70'),
('14','20'),
('15','18'),
('16','2'),
('17','2'),
('18','38'),
('19','18'),
('20','35'),
('21','20'),
('22','28'),
('23','28'),
('24','6'),
('25','4'),
('26','18');

SELECT * FROM tbl_Players
SELECT * FROM tbl_PlayersName
SELECT * FROM tbl_PlayersStatistics
SELECT * FROM tbl_Contracts
SELECT * FROM tbl_Nationalities
SELECT * FROM tbl_Positions
SELECT * FROM tbl_MarketValue

END
---
EXEC dbo.ManchesterUnited
