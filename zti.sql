SELECT nazwisko FROM __firma_zti.pracownik ORDER BY nazwisko ASC;
SELECT imie,nazwisko FROM __firma_zti.pracownik WHERE year(data_urodzenia)>1979;
SELECT * FROM __firma_zti.pracownik WHERE pensja BETWEEN 3500 AND 5000;
SELECT towar FROM __firma_zti.stan_magazynowy WHERE ilosc>10;
SELECT nazwa_towaru FROM __firma_zti.towar WHERE nazwa_towaru LIKE "A%" OR nazwa_towaru LIKE "B%" OR nazwa_towaru LIKE "C%";
SELECT numer_zamowienia FROM __firma_zti.zamowienie ORDER BY data_zamowienia DESC LIMIT 10;
SELECT pelna_nazwa FROM __firma_zti.klient WHERE czy_firma=0;
SELECT imie,nazwisko FROM __firma_zti.pracownik ORDER BY pensja ASC LIMIT 5;
SELECT nazwa_towaru FROM __firma_zti.towar WHERE nazwa_towaru NOT LIKE "%a%" ORDER BY cena_zakupu DESC;
SELECT nazwa_towaru,j.nazwa,t.cena_zakupu FROM __firma_zti.towar t INNER JOIN stan_magazynowy s ON t.id_towaru = s.towar INNER JOIN jednostka_miary j ON s.jm = j.id_jednostki WHERE j.nazwa = 'szt' ORDER BY t.nazwa_towaru ASC, t.cena_zakupu DESC;
CREATE TABLE towary_powyzej_100 SELECT * FROM towary WHERE cena.zakupu>100;
CREATE TABLE pracownik_50_plus LIKE pracownik;
INSERT INTO pracownik_50_plus SELECT * FROM pracownik WHERE 2021-year(data_urodzenia)>=50;

SELECT p.imie,p.nazwisko,d.nazwa FROM pracownik p INNER JOIN dzial d ON p.dzial=d.id_dzialu;
SELECT t.nazwa_towaru,k.nazwa_kategori,s.ilosc FROM stan_magazynowy s INNER JOIN towar t ON s.towar=t.id_towaru INNER JOIN kategoria k ON t.kategoria=k.id_kategori;
SELECT z.numer_zamowienia,s.nazwa_statusu_zamowienia FROM zamowienie z INNER JOIN status_zamowienia s ON z.status_zamowienia=s.id_statusu_zamowienia WHERE nazwa_statusu_zamowienia ='anulowane';
SELECT nazwa_krotka FROM klient k INNER JOIN adres_klienta a ON k.id_klienta=a.klient WHERE a.miejscowosc="Olsztyn";
SELECT j.nazwa FROM jednostka_miary j LEFT JOIN stan_magazynowy s ON j.id_jednostki=s.jm;
