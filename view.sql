CREATE DATABASE viewStechkin;
USE viewStechkin;

CREATE TABLE laps(
    lapsID INT NOT NULL PRIMARY KEY identity,
    nimi VARCHAR(40) NOT NULL,
    pikkus SMALLINT,
    synniaasta INT NULL,
    synnilinn VARCHAR(15)
);

CREATE TABLE loom(
    loomID INT NOT NULL PRIMARY KEY identity,
    nimi VARCHAR(40) NOT NULL,
    kaal SMALLINT,
    lapsID INT,
    FOREIGN KEY (lapsID) REFERENCES laps(lapsID)
);

INSERT INTO laps(nimi, pikkus, synniaasta, synnilinn)
VALUES ('Matvei', 150, 2005, 'Tallinn'),
('Andrei', 155, 2006, 'Tallinn'),
('Maks', 160, 2005, 'Tallinn'),
('Ilia', 150, 2007, 'Tallinn'),
('Damian', 145, 2015, 'Tartu');

select * from laps;

INSERT loom (nimi, kaal, lapsID)
VALUES ('koer Musa', 5, 1),
('kass Muu', 5, 1),
('hamster Test', 1, 2),
('jänes Lill', 2, 2);

select * from loom;
select * from laps;

--select lause 2 seotud tabelite põhjal
select * from laps INNER JOIN loom
ON laps.lapsID = loom.lapsID
--kitsaim variant
select l.nimi, lm.nimi FROM laps l INNER JOIN loom lm
ON l.lapsID = lm.lapsID;
--salvestame päring view abil
CREATE VIEW sisestatud_lapsiloomad AS
SELECT l.nimi as lapsNimi, lm.nimi as loomNimi
FROM laps l INNER JOIN loom lm
ON l.lapsID = lm.lapsID;

--kasutame salvestud view
select * from sisestatud_lapsiloomad;
--21.
CREATE VIEW lapsedIlmaLoomata AS
SELECT lp.nimi AS lapsenimi, 
       l.nimi AS loomanimi, 
       l.kaal, 
       lp.synnilinn
FROM laps AS lp LEFT JOIN loom AS l
ON l.lapsID = lp.lapsID;
--kasutame salvestud view
select * from lapsedIlmaLoomata;
select lapsenimi, loomanimi from lapsedIlmaLoomata;

CREATE TABLE varjupaik(
    varjupaikID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    koht VARCHAR(50) NOT NULL,
    firma VARCHAR(30)
);
ALTER TABLE loom 
ADD varjupaikID INT;

ALTER TABLE loom 
ADD CONSTRAINT fk_varjupaik
FOREIGN KEY (varjupaikID) REFERENCES varjupaik(varjupaikID);

INSERT INTO varjupaik(koht, firma)
VALUES ('Paljassaare', 'Varjupaikade MTÜ');
--Kontrollime tabelit:

SELECT * FROM varjupaik;

UPDATE loom 
SET varjupaikID = 1;

--loome view / vaade mis kasutab 3 tabelit
CREATE VIEW lapseloomadVarjupaigas AS
SELECT lp.nimi AS lapsenimi, 
       l.nimi AS loomanimi, 
       v.koht
FROM laps AS lp, loom AS l, varjupaik AS v
WHERE l.lapsID = lp.lapsID 
AND l.varjupaikID = v.varjupaikID;

--kasutamine salvestatud view
select * from lapseloomadVarjupaigas;
--dbo - database object

--View, kus on ainult kassid
CREATE VIEW kassid AS
SELECT * from loom 
WHERE nimi like 'kass%';

select * from kassid;

--View, kus on lapsed alla 20 aastat
CREATE VIEW LapsedAlla20 AS
select nimi, synniaasta, (2026-synniaasta) AS Vanus from laps
where synniaasta >= 2006;

select * from LapsedAlla20;
DROP VIEW LapsedAlla20

--view, mis arvutab keskmine loomakaal
CREATE VIEW KeskmineKaal as
select AVG(kaal) as  keskmineKaal from loom;

select * from KeskmineKaal

--Kas võib teha UPDATE VIEW?
--ja mida ta muudab?
CREATE VIEW loomad AS
SELECT nimi, kaal FROM loom;
select * from loom;
select * from loomad;
--suurendame kaal 50% võrra
UPDATE loomad SET kaal = kaal*2;