
CREATE TABLE `postacie` (
  `id_postaci` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(40) DEFAULT NULL,
  `rodzaj` enum('wiking','ptak','kobieta') DEFAULT NULL,
  `data_ur` date DEFAULT NULL,
  `wiek` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_postaci`)
);

INSERT INTO postacie(nazwa,rodzaj,data_ur,wiek) VALUES ('Bjorn','wiking',2001-01-01,35),('Drozd','ptak',2001-01-01,3),('Tesciowa','kobieta',2001-01-01,78);

UPDATE postacie SET wiek=88 WHERE id_postaci=3;

CREATE TABLE `walizka` (
  `id_walizki` int NOT NULL AUTO_INCREMENT,
  `pojemnosc` int unsigned DEFAULT NULL,
  `kolor` enum('rozowy','czerwony','teczowy','zolty') DEFAULT 'rozowy',
  `id_wlasciciela` int DEFAULT NULL,
  PRIMARY KEY (`id_walizki`),
  KEY `id_wlasciciela` (`id_wlasciciela`),
  CONSTRAINT `walizka_ibfk_1` FOREIGN KEY (`id_wlasciciela`) REFERENCES `postacie` (`id_postaci`)
);

ATER TABLE walizka ALTER kolor SET DEFAULT 'rozowy';

INSERT INTO walizka(pojemnosc,kolor,id_wlasciciela) VALUES (100,'rozowy',1),(1000,'tezcowy',3);

CREATE TABLE `izba` (
   `adres_budynku` VARCHAR(40) NOT NULL,
   `nazwa_izby` INT NOT NULL,
   `metraz` INT UNSIGNED,
   `wlasciciel` INT,
   FOREIGN KEY (wlasciciel) REFERENCES postacie(id_postaci) ON DELETE SET NULL
);

ALTER TABLE `izba` ADD PRIMARY KEY (`adres_budynku`,`nazwa_izby`);

ALTER TABLE `izba` ADD COLUMN `kolor_izby` VARCHAR(40) DEFAULT 'czarny' AFTER `metraz`;

INSERT INTO `izba` VALUES ('kolorowa 5','spizarnia',120,1); 

CREATE TABLE `przetwory` (
   `id_przetworu` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   `rok_produkcji` INT(4) DEFAULT '1645',
   `id_wykonawcy` INT NOT NULL,
   `zawartosc` VARCHAR(40),
   `dodatek` VARCHAR(40) DEFAULT `papryczka_chilli`,
   `id_konsumenta` INT NOT NULL,
   FOREIGN KEY (id_wykonawcy) REFERENCES postacie(id_postaci),
   FOREIGN KEY (id_konsumenta) REFERENCES postacie(id_postaci)
);

INSERT INTO przetwory VALUES (1,1644,1,'bigos',default,2);


INSERT INTO postacie(nazwa,rodzaj,data_ur,wiek) VALUES 
('Arne','wiking','1659-01-01',25),
('Birger','wiking','1647-01-01',46),
('Erik','wiking','1654-01-01',64),
('Frode','wiking','1634-01-01',35),
('Gorm','wiking','1644-01-01', 14);

CREATE TABLE statek (
   `nazwa_statku` VARCHAR(40) NOT NULL PRIMARY KEY,
   `rodzaj statku` ENUM ('Byrding','Drakkar','Knara','Langskip','Sneka'),
   `data wodowania` DATE,
   `max_ladownosc` INT UNSIGNED
);

INSERT INTO statek VALUES 
('statek1', 'Drakkar', '1657-01-01','7'),
('statek2', 'Langskip', '1655-02-02', '8');

ALTER TABLE postacie ADD COLUMN 'funkcja' VARCHAR(40);

UPDATE postacie SET funkcja = 'kapitan' WHERE id_postaci = 1;

ALTER TABLE postacie ADD COLUMN statek VARCHAR(40);

ALTER TABLE postacie ADD FOREIGN KEY (statek) REFERENCES statek(nazwa_statku);

UPDATE postacie SET statek = 'statek1' WHERE id_postaci <  3;

UPDATE postacie SET statek = 'statek1' WHERE id_postaci > 3 AND id_postaci < 5;

DELETE FROM izba WHERE nazwa_izby = 'spizarnia';

DROP TABLE izba;

DELETE FROM postacie WHERE nazwa!='Bjorn' AND nazwa='Erik' AND nazwa='Birger';

ALTER TABLE postacie DROP FOREIGN KEY id_postaci;

ALTER TABLE postacie DROP PRIMARY KEY;

ALTER TABLE postacie ADD COLUMN PESEL INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE postacie ADD PRIMARY KEY PESEL;

ALTER TABLE postacie MODIFY `rodzaj` enum('wiking','ptak','kobieta','syrena') DEFAULT NULL,

INSERT INTO postacie ('nazwa','rodzaj','data_ur','wiek','pesel') VALUES ('Gertruda Nieszczera','syrena','1676-01-01','155','09876542314');

ALTER TABLE postacie SET statek='statek1' WHERE nazwa LIKE '%a%';

ALTER TABLE statek SET max_ladownosc= 0.7 * max_ladownosc;

ALTER TABLE postacie ADD CHECK (wiek<=1000);

CREATE TABLE marynarz SELECT * FROM postacie WHERE statek IS NOT NULL;

UPDATE postacie SET statek IS NULL;

DELETE * FROM postacie WHERE nazwa='Frode';

TRUNCATE TABLE statek;

DROP TABLE statek;

CREATE TABLE zwierz (id INT AUTO_INCREMENT NOT NULL, nazwa varchar(40), wiek INT(3), PRIMARY KEY id)

CREATE TABLE kreatura SELECT * FROM wikingowie.kreatura;

CREATE TABLE zasob SELECT * FROM wikingowie.zasob;

CREATE TABLE ekwipunek SELECT * FROM wikingowie.ekwipunek;

SELECT * FROM zasob;

SELECT * FROM zasob WHERE typ ='jedzenie';

SELECT idZasobu,ilosc FROM zasob WHERE kreatura.id_kreatury IN (1,3,5);

SELECT * FROM kreatura WHERE rodzaj != 'wiedzma' AND udzwig = 50;

SELECT * FROM zasoby WHERE waga BETWEEN 2 AND 5;

SELECT * FROM kreatura LIKE '%or%' AND WHERE udzwig BETWEEN 30 AND 70;

SELECT * FROM zasob WHERE month(dataPozyskania) IN (7,8);

SELECT * FROM zasoby WHERE rodzaj IS NOT NULL ORDER BY waga ASC;

SELECT TOP 5 * FROM kreatura ORDER BY dataUR ASC;

SELECT DISTINCT rodzaj FROM zasob;

SELECT CONCAT(nazwa,' ',rodzaj) FROM kreatura WHERE nazwa LIKE 'wi%';

SELECT nazwa, waga*ilosc AS waga_calkowita, dataPozyskania, rodzaj FROM zasob WHERE YEAR(dataPozyskania) BETWEEN 2000 AND 2007;

SELECT nazwa,waga*0.7 AS waga_wlasciwa, waga*0.3 AS waga_odpadu FROM zasob WHERE rodzaj = 'jedzenie';

SELECT * FROM zasob WHERE rodzaj IS NULL;

SELECT rodzaj FROM zasob WHERE nazwa IN ('Ba%' or '%os') GROUP BY rodzaj ORDER BY min(rodzaj);
