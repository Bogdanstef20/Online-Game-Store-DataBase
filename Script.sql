DROP TABLE IF EXISTS bundle_cumparator;
DROP TABLE IF EXISTS joc_bundle;
DROP TABLE IF EXISTS joc_cumparator;
DROP TABLE IF EXISTS bundle;
DROP TABLE IF EXISTS recomandare;
DROP TABLE IF EXISTS DLC;
DROP TABLE IF EXISTS joc;
DROP TABLE IF EXISTS administrator;
DROP TABLE IF EXISTS distribuitor;
DROP TABLE IF EXISTS cumparator;

CREATE TABLE cumparator (
    id_cumparator SERIAL PRIMARY KEY,
    nume VARCHAR(20) NOT NULL,
    prenume VARCHAR(20) NOT NULL,
    email VARCHAR(40) NOT NULL, 
	nr_tel VARCHAR(10) NOT NULL UNIQUE CHECK (nr_tel ~ '^[0-9]{10}$'),
	data_inregistrare DATE NOT NULL
);

INSERT INTO cumparator (nume, prenume, email, nr_tel, data_inregistrare) VALUES
('Hedvig', 'Gordana','hgordana@bogdan.com' ,'0737111111' ,'2020-12-20' ),
('Eveline', 'Florence','eflorence@bogdan.com' ,'0737529783' ,'2019-10-31' ),
('Ashleigh', 'Farid','afarid@bogdan.com' ,'0737238224' ,'2019-08-23' ),
('Yudes', 'Ademola','yademola@bogdan.com' ,'0700068569' ,'2020-05-07' ),
('Cyneburg', 'Dennis','cdennis@bogdan.com' ,'0726518469' ,'2019-10-14' ),
('Shadi', 'Christelle','schristelle@bogdan.com' ,'0770816142' ,'2020-05-12' ),
('Vincent', 'Winnifred','vwinnifred@bogdan.com' ,'0737461585' ,'2021-10-05' ),
('Geraint', 'Eguzki','geguzki@bogdan.com' ,'0772089871' ,'2022-06-27' ),
('Olawale', 'Dzafer','odzafer@bogdan.com' ,'0723954581' ,'2022-10-22' ),
('Arete', 'Nils','anils@bogdan.com' ,'0769608952' ,'2021-08-29' ),
('Moira', 'Harumi','mharumi@bogdan.com' ,'0778133965' ,'2020-05-20' ),
('Matheus', 'Vayu','mvayu@bogdan.com' ,'0708103151' ,'2022-12-11' );

CREATE TABLE distribuitor (
    id_distribuitor SERIAL PRIMARY KEY,
    nume VARCHAR(20) NOT NULL,
    sediu VARCHAR(20) NOT NULL
);

INSERT INTO distribuitor (nume,sediu) VALUES
('Ubisoft','Franta'),
('ElectronicArts','USA'),
('RiotGames','USA'),
('2k','USA'),
('Nintendo','Japonia'),
('RockstarGames','USA'),
('Blizzard','USA');

CREATE TABLE administrator (
    id_administrator SERIAL PRIMARY KEY,
    nume VARCHAR(20) NOT NULL,
    prenume VARCHAR(20) NOT NULL,
    email VARCHAR(40) NOT NULL, 
	nr_tel VARCHAR(10) NOT NULL UNIQUE CHECK (nr_tel ~ '^[0-9]{10}$'),
	salariu VARCHAR(10) NOT NULL
);

INSERT INTO administrator (nume, prenume, email, nr_tel, salariu) VALUES
('Wario', 'Eochaid','weochaid@bogdan.com' ,'0737222222' ,'4500' ),
('Ninhursag', 'Magdalena','nmagdalena@bogdan.com' ,'0737513413' ,'3500' ),
('Pearl', 'Teshub','pteshub@bogdan.com' ,'0737221578' ,'4000' ),
('Deborah', 'Hippokrates','dhippokrates@bogdan.com' ,'0723702037' ,'3750' ),
('Lazaros', 'Leanid','lleanid@bogdan.com' ,'0766098232' ,'4500' ),
('Yelena', 'Kusti','ykusti@bogdan.com' ,'0750690957' ,'5500' ),
('Anupama', 'Timaios','atimaios@bogdan.com' ,'0769655134' ,'6750' ),
('Dmitrii', 'Gisella','dgisella@bogdan.com' ,'0726899999' ,'6000' );

CREATE TABLE joc (
    id_joc SERIAL PRIMARY KEY,
    nume VARCHAR(40) NOT NULL,
    pret VARCHAR(20) NOT NULL,
    dimensiune VARCHAR(20) NOT NULL, 
	data_aparitie DATE NOT NULL,
	tip_joc VARCHAR(20) NOT NULL,
	id_administrator INTEGER REFERENCES administrator(id_administrator) ON DELETE CASCADE,
	id_distribuitor INTEGER REFERENCES distribuitor(id_distribuitor) ON DELETE CASCADE
	
);

INSERT INTO joc(nume,pret,dimensiune,data_aparitie,tip_joc,id_administrator,id_distribuitor) VALUES

('Assassins Creed Origins','50','42Gb', '2017-10-27','action-roleplaying','4','1'),
('Far Cry 5','65','40Gb', '2018-03-27','action','6','1'),
('EaSports FC 24','157','100Gb', '2023-09-29','sport','1','2'),
('Ruined King','152','15Gb', '2021-11-16','role-playing','7','3'),
('NBA2k24','90','108Gb', '2023-09-08','sport','8','4'),
('WWE2k23','50','80Gb', '2023-03-14','sport','2','4'),
('Pokemon Scarlet/Violet','300','8Gb', '2022-11-18','role-playing','2','5'),
('The Legend of Zelda','288','14Gb', '2017-03-03','action-adventure','3','5'),
('GTAV','51','72Gb', '2013-09-17','action-adventure','1','6'),
('Red Dead Redemption 2','77','150Gb', '2019-11-5','action-adventure','4','6'),
('Diablo IV','350','90Gb', '2023-06-05','action-role-playing','3','7'),
('StarCraft Remastered','110','3Gb', '2017-08-14','strategy','8','7'),
('UFC 5','239','38Gb', '2023-10-27','action','3','2');

CREATE TABLE DLC (
    id_DLC SERIAL PRIMARY KEY,
    nume VARCHAR(20) NOT NULL,
    dimensiune VARCHAR(20) NOT NULL,
	data_aparitie DATE NOT NULL
);

INSERT INTO DLC(nume,dimensiune,data_aparitie) VALUES

('DLCJoc1','10Gb','2017-11-27'),
('DLCJoc2','15Gb','2018-04-27'),
('DLCJoc3','10Gb','2023-10-29'),
('DLCJoc4','11Gb','2021-12-16'),
('DLCJoc5','12Gb','2023-10-08'),
('DLCJoc6','12Gb','2023-04-14'),
('DLCJoc7','17Gb','2022-12-18'),
('DLCJoc8','20Gb','2017-04-03'),
('DLCJoc9','5Gb','2013-10-17'),
('DLCJoc10','7Gb','2019-12-5'),
('DLCJoc11','8Gb','2023-07-05'),
('DLCJoc12','16Gb','2017-09-14'),
('DLCJoc13','19Gb','2023-11-27');

CREATE TABLE recomandare (
    id_recomandare SERIAL PRIMARY KEY,
    nume_joc VARCHAR(40) NOT NULL,
    review VARCHAR(50) NOT NULL,
	data_postare DATE NOT NULL,
	nota_joc numeric CHECK (nota_joc >= 1 AND nota_joc <= 10)
);

INSERT INTO recomandare(nume_joc,review,data_postare,nota_joc) VALUES

('Assassins Creed Origins', 'Un joc foarte bun','2018-10-27','9'),
('Far Cry 5', 'Un joc bun','2019-03-27','7'),
('EASports FC 24', 'Un joc foarte prost','2023-12-29','3'),
('Ruined King', 'Un joc foarte bun','2022-11-16','10'),
('NBA2k24', 'Un joc ok','2023-12-08','6'),
('WWE2k23', 'Un joc ok','2023-08-14','6'),
('Pokemon Scarlet/Violet', 'Un joc prost','2023-11-18','5'),
('The Legend of Zelda', 'Un joc bun','2018-03-03','8'),
('GTAV', 'Un joc foarte bun','2015-09-17','10'),
('Diablo IV', 'Un joc foarte prost','2023-10-05','2'),
('StarCraft Remastered', 'Un joc ok','2018-08-14','6'),
('UFC 5', 'Un joc ok','2023-12-27','6');

CREATE TABLE bundle (
    id_bundle SERIAL PRIMARY KEY,
    reducere VARCHAR(20) NOT NULL,
    zile_disponibile VARCHAR(20) NOT NULL,
	data_aparitiei DATE NOT NULL
);

INSERT INTO bundle(reducere,zile_disponibile,data_aparitiei) VALUES

('20%', '31', '2023-06-28'),
('30%', '25', '2023-07-15'),
('40%', '20', '2023-08-21'),
('35%', '100', '2023-08-25'),
('45%', '10', '2023-09-04'),
('10%', '300', '2023-12-09'),
('90%', '1', '2023-12-14'),
('50%', '5', '2023-12-26');

CREATE TABLE joc_cumparator (
    id_joc_cumparator INTEGER CONSTRAINT id_joc_cumparator PRIMARY KEY,
    id_joc INTEGER NOT NULL CONSTRAINT fk_id_joc REFERENCES joc(id_joc) ON DELETE CASCADE,
    id_cumparator INTEGER NOT NULL CONSTRAINT fk_id_cumparator REFERENCES cumparator(id_cumparator) ON DELETE CASCADE

);

INSERT INTO joc_cumparator VALUES

('1','1','8'),
('2','1','7'),
('3','2','4'),
('4','2','12'),
('5','3','11'),
('6','3','9'),
('7','4','4'),
('8','4','3'),
('9','5','2'),
('10','5','1'),
('11','6','5'),
('12','6','6'),
('13','7','10'),
('14','7','11'),
('15','8','12'),
('16','8','5'),
('17','9','7'),
('18','9','9'),
('19','10','3'),
('20','10','8'),
('21','11','1'),
('22','11','10'),
('23','12','11'),
('24','12','4'),
('25','13','7'),
('26','13','2');

CREATE TABLE joc_bundle (
    id_joc_bundle INTEGER CONSTRAINT id_joc_bundle PRIMARY KEY,
    id_joc INTEGER NOT NULL CONSTRAINT fk_id_joc REFERENCES joc(id_joc) ON DELETE CASCADE,
    id_bundle INTEGER NOT NULL CONSTRAINT fk_id_bundle REFERENCES bundle(id_bundle) ON DELETE CASCADE

);

INSERT INTO joc_bundle VALUES

('1','1','6'),
('2','2','7'),
('3','3','3'),
('4','4','3'),
('5','5','8'),
('6','6','1'),
('7','7','2'),
('8','8','5'),
('9','9','4'),
('10','10','7'),
('11','11','1'),
('12','12','2'),
('13','13','8'),
('14','6','4'),
('15','9','5'),
('16','8','2');

CREATE TABLE bundle_cumparator (
    id_bundle_cumparator INTEGER CONSTRAINT id_bundle_cumparator PRIMARY KEY,
    id_bundle INTEGER NOT NULL CONSTRAINT fk_id_bundle REFERENCES bundle(id_bundle) ON DELETE CASCADE,
    id_cumparator INTEGER NOT NULL CONSTRAINT fk_id_cumparator REFERENCES cumparator(id_cumparator) ON DELETE CASCADE

);

INSERT INTO bundle_cumparator VALUES

('1','1','8'),
('2','1','9'),
('3','2','1'),
('4','2','12'),
('5','3','5'),
('6','3','3'),
('7','4','4'),
('8','4','10'),
('9','5','11'),
('10','5','7'),
('11','6','6'),
('12','6','2'),
('13','7','3'),
('14','7','7'),
('15','8','12'),
('16','8','10');