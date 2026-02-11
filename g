CREATE DATABASE stechkinTAR1;
use stechkinTAR1;

--tabeli loomine
CREATE TABLE tootaja(
tootajaID int PRIMARY KEY identity(1,1),
eesnimi varchar(30),
perenimi varchar(30),
synniaeg date,
koormus decimal(5,2),
elukoht TEXT,
abielus bit
);
--tabeli kustutamine 
drop table tootaja 
--tabeli kuvamine 
select * from tootaja;
INSERT INTO tootaja(eesnimi, perenimi, synniaeg)
VALUES ('Jummy', 'Päev', '2025-10-13'), 
('Maikl', 'Valgus', '2025-10-13'),
('Trevis', 'Kapp', '2025-10-13');
