
CREATE TABLE `baza` (
  `id_postaci` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(40) DEFAULT NULL,
  `rodzaj` enum('wiking','ptak','kobieta') DEFAULT NULL,
  `data_ur` date DEFAULT NULL,
  `wiek` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_postaci`)
);

INSERT INTO baza(nazwa,rodzaj,data_ur,wiek) VALUES ('Bjorn','wiking',2001-01-01,35),('Drozd','ptak',2001-01-01,3),

('Tesciowa','kobieta',2001-01-01,78);

UPDATE baza SET wiek=88 WHERE id_postaci=3;

CREATE TABLE `walizka` (
  `id_walizki` int NOT NULL AUTO_INCREMENT,
  `pojemnosc` int unsigned DEFAULT NULL,
  `kolor` enum('rozowy','czerwony','teczowy','zolty') DEFAULT 'rozowy',
  `id_wlasciciela` int DEFAULT NULL,
  PRIMARY KEY (`id_walizki`),
  KEY `id_wlasciciela` (`id_wlasciciela`),
  CONSTRAINT `walizka_ibfk_1` FOREIGN KEY (`id_wlasciciela`) REFERENCES `baza` (`id_postaci`)
);

ATER TABLE walizka ALTER kolor SET DEFAULT 'rozowy';

INSERT INTO walizka(pojemnosc,kolor,id_wlasciciela) VALUES (100,'rozowy',1),(1000,'tezcowy',3);

CREATE TABLE `izba` (
   `adres_budynku` VARCHAR(40) NOT NULL,
   `nazwa_izby` INT NOT NULL,
   `metraz` INT UNSIGNED,
   `wlasciciel` INT,
   FOREIGN KEY (wlasciciel) REFERENCES baza(id_postaci) ON DELETE SET NULL
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
   FOREIGN KEY (id_wykonawcy) REFERENCES baza(id_postaci),
   FOREIGN KEY (id_konsumenta) REFERENCES baza(id_postaci)
);

INSERT INTO przetwory VALUES (1,1644,1,'bigos',default,2);


INSERT INTO baza(nazwa,rodzaj,data_ur,wiek) VALUES 
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

ALTER TABLE baza ADD COLUMN 'funkcja' VARCHAR(40);

UPDATE baza SET funkcja = 'kapitan' WHERE id_postaci = 1;

ALTER TABLE baza ADD COLUMN statek VARCHAR(40);

ALTER TABLE baza ADD FOREIGN KEY (statek) REFERENCES statek(nazwa_statku);

UPDATE baza SET statek = 'statek1' WHERE id_postaci < 3;
 
UPDATE baza SET statek = 'statek1' WHERE id_postaci > 3 AND id_postaci < 5;

DELETE FROM izba WHERE nazwa_izby = 'spizarnia';

DROP TABLE izba;
