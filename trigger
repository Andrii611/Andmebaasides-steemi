CREATE DATABASE trigerStechkin;
use trigerStechkin;
--tabel linnad 
CREATE TABLE linnad(
linnId int primary key identity(1,1),
linnadnimi varchar(50) unique,
rahvaarv int not null);
--tabel logi
CREATE TABLE logi(
Id int primary key identity(1,1),
kuupaev datetime,
andmed TEXT);

--Insert triger
CREATE TRIGGER linnaLisamine
ON linnad 
FOR INSERT 
AS
INSERT INTO logi(kuupaev, andmed)
SELECT 
GETDATE(), inserted.linnadnimi
FROM inserted;
--kontrollimiseks tuleb lisada uus linn tabelisse linnad 
INSERT INTO linnad (linnadnimi, rahvaarv)
VALUES ('Narva', 60000);
SELECT * FROM linnad;
SELECT * FROM logi;

--kustutame triger
drop trigger linnaLisamine;

CREATE TRIGGER linnaLisamine
ON linnad 
FOR INSERT 
AS
INSERT INTO logi(kuupaev, andmed)
SELECT 
GETDATE(), 
CONCAT('lisatud linn: ', inserted.linnadnimi,
' rahvaarv: ', inserted.rahvaarv, ' | id: ', inserted.linnId)
FROM inserted;

--DELETE TRIGGER
CREATE TRIGGER linnaKustutamine
ON linnad 
FOR DELETE
AS
INSERT INTO logi(kuupaev, andmed)
SELECT 
GETDATE(), 
CONCAT('kustutatud linn: ', deleted.linnadnimi,
' rahvaarv: ', deleted.rahvaarv, ' | id: ', deleted.linnId)
FROM deleted;

delete from linnad where linnId=1;
SELECT * FROM linnad
SELECT * FROM logi

CREATE TRIGGER linnaUuendamine
ON linnad 
FOR UPDATE
AS
INSERT INTO logi(kuupaev, andmed)
SELECT 
GETDATE(), 
CONCAT('kustutatud linn: ', d.linnadnimi,
' | ', d.rahvaarv, ' | id: ', d.linnId,
'uued linna andmed: ',i.linnadnimi,
' | ', i.rahvaarv, ' | id: ', i.linnId)
FROM deleted d INNER JOIN inserted i
ON d.linnId = i.linnId;

--kontrollmiseks uuendame linna andmed
SELECT * FROM linnad 
UPDATE linnad SET linnadnimi = 'Tapa uus', rahvaarv=25
WHERE linnId = 2;
SELECT * FROM linnad; 
SELECT * FROM logi;
