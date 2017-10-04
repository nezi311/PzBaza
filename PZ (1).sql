-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 04 Paź 2017, 18:23
-- Wersja serwera: 10.1.24-MariaDB
-- Wersja PHP: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `PZ`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bilans`
--

CREATE TABLE `bilans` (
  `IdBilans` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cennik`
--

CREATE TABLE `cennik` (
  `idCennik` int(11) NOT NULL,
  `idTowar` int(11) DEFAULT NULL,
  `cena` float NOT NULL,
  `dataOd` date NOT NULL,
  `dataDo` date DEFAULT NULL,
  `aktualny` varchar(1) DEFAULT 'T',
  `opis` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `cennik`
--

INSERT INTO `cennik` (`idCennik`, `idTowar`, `cena`, `dataOd`, `dataDo`, `aktualny`, `opis`) VALUES
(1, 1, 80, '2017-06-01', '2017-06-20', 'T', NULL),
(2, 2, 100, '2017-06-01', '2017-06-20', 'T', NULL),
(3, 3, 50, '2017-06-01', '2017-06-20', 'T', NULL),
(4, 4, 120, '2017-06-01', '2017-06-03', 'T', NULL),
(5, 4, 124, '2017-06-04', '2017-06-23', 'T', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawca`
--

CREATE TABLE `dostawca` (
  `IdDostawca` int(11) NOT NULL,
  `NazwaSkrocona` varchar(100) NOT NULL,
  `NazwaPelna` varchar(100) NOT NULL,
  `NIP` varchar(10) NOT NULL,
  `Telefon1` varchar(20) DEFAULT NULL,
  `Telefon2` varchar(20) DEFAULT NULL,
  `Telefon3` varchar(20) DEFAULT NULL,
  `NazwaDzialu` varchar(50) NOT NULL,
  `NrKonta` varchar(30) NOT NULL,
  `Adres` varchar(50) NOT NULL,
  `KodPocztowy` varchar(6) NOT NULL,
  `Poczta` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `dostawca`
--

INSERT INTO `dostawca` (`IdDostawca`, `NazwaSkrocona`, `NazwaPelna`, `NIP`, `Telefon1`, `Telefon2`, `Telefon3`, `NazwaDzialu`, `NrKonta`, `Adres`, `KodPocztowy`, `Poczta`) VALUES
(1, 'DPD', 'DPD', '0987654321', '123456789', '123656789', '123856789', 'elektronika', '4487547836587346', 'Kalisz, Jasna 21', '11-666', 'Kalisz');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawcatowar`
--

CREATE TABLE `dostawcatowar` (
  `IdDostawcaTowar` int(11) NOT NULL,
  `IdDostawca` int(11) NOT NULL,
  `IdTowar` int(11) NOT NULL,
  `Cena` float NOT NULL,
  `DataOd` date NOT NULL,
  `DataDo` date DEFAULT NULL,
  `KodTowaruWgDostawcy` varchar(50) NOT NULL,
  `NazwaTowaruWgDostawcy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `dostawcatowar`
--

INSERT INTO `dostawcatowar` (`IdDostawcaTowar`, `IdDostawca`, `IdTowar`, `Cena`, `DataOd`, `DataDo`, `KodTowaruWgDostawcy`, `NazwaTowaruWgDostawcy`) VALUES
(1, 1, 1, 600, '2017-03-13', '2017-03-23', '648464168464', 'DELL 24\"'),
(2, 1, 2, 250, '2017-03-07', '2017-03-12', '1551555131353', 'Mysz Zowie EC1-A');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jednostkamiary`
--

CREATE TABLE `jednostkamiary` (
  `IdJednostkaMiary` int(11) NOT NULL,
  `Nazwa` varchar(100) NOT NULL,
  `NazwaSkrocona` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `jednostkamiary`
--

INSERT INTO `jednostkamiary` (`IdJednostkaMiary`, `Nazwa`, `NazwaSkrocona`) VALUES
(1, 'sztuka', 'szt'),
(2, 'litr', 'l');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `IdKategoria` int(11) NOT NULL,
  `NazwaKategorii` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `kategoria`
--

INSERT INTO `kategoria` (`IdKategoria`, `NazwaKategorii`) VALUES
(1, 'elektronika'),
(2, 'Inne');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Klient`
--

CREATE TABLE `Klient` (
  `IdKlient` int(11) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `NIP` varchar(10) NOT NULL,
  `Miasto` varchar(50) NOT NULL,
  `Ulica` varchar(50) NOT NULL,
  `Dom` varchar(50) NOT NULL,
  `Lokal` varchar(50) DEFAULT NULL,
  `KodPocztowy` varchar(6) NOT NULL,
  `Poczta` varchar(30) NOT NULL,
  `Telefon` int(11) NOT NULL,
  `NrKonta` varchar(32) NOT NULL,
  `Bank` varchar(30) NOT NULL,
  `EMail` varchar(30) NOT NULL,
  `NazwaFirmy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Klient`
--

INSERT INTO `Klient` (`IdKlient`, `Imie`, `Nazwisko`, `NIP`, `Miasto`, `Ulica`, `Dom`, `Lokal`, `KodPocztowy`, `Poczta`, `Telefon`, `NrKonta`, `Bank`, `EMail`, `NazwaFirmy`) VALUES
(1, 'Michal', 'Kowalski', '0123456789', 'OstrÃ³w Wlkp', 'Matejki', '21', '', '63-400', 'OstrÃ³w Wlkp', 132456789, '23 1500 1663 1234 9661 8188 7238', 'PKO', 'michal123@wp.pl', 'Drutex'),
(2, 'Dawid', 'Kowalski', '654789713', 'OstrÃ³w Wlkp', 'Parczewskiego', '31', '22', '63-400', 'OstrÃ³w Wlkp', 636547732, '23 1500 4567 1234 9661 8188 7238', 'Skok Stefczyka', 'DKowal123@wp.pl', 'Marmoladex'),
(3, 'Maciej', 'Marciniak', '0122456789', 'OstrÃ³w Wlkp', 'Strzelecka', '5B', '7', '63-400', 'OstrÃ³w Wlkp', 763577335, '23 1500 1663 1234 9876 8188 7238', 'Milenium', 'maciux@wp.pl', 'Maciux i spÃ³Å‚ka'),
(4, 'Kamil', 'Kowalski', '0123875789', 'Kalisz', 'Radosna', '69', '', '63-401', 'Kalisz', 675463347, '23 1500 1663 1234 9661 8188 5632', 'Amber Gold', 'dojlido123@wp.pl', 'Kamilonex');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `koszyk`
--

CREATE TABLE `koszyk` (
  `id` int(11) NOT NULL,
  `IdTowar` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `cena` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `magazyn`
--

CREATE TABLE `magazyn` (
  `IdMagazyn` int(11) NOT NULL,
  `NazwaMagazyn` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id` int(11) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `dzial` varchar(150) NOT NULL,
  `stanowisko` varchar(150) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `login` varchar(100) NOT NULL,
  `haslo` varchar(150) NOT NULL,
  `uprawnienia` int(11) NOT NULL,
  `aktywny` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id`, `imie`, `nazwisko`, `dzial`, `stanowisko`, `telefon`, `login`, `haslo`, `uprawnienia`, `aktywny`) VALUES
(1, 'Dawid', 'Dominiak', 'IT', 'Administrator', '666666666', 'root', '5f4dcc3b5aa765d61d8327deb882cf99', 0, 1),
(2, 'Marcin', 'Kornalski', 'ObsÅ‚uga klienta', 'Pracownik', '777666555', 'pracownik', '5f4dcc3b5aa765d61d8327deb882cf99', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pz`
--

CREATE TABLE `pz` (
  `IdPZ` int(11) NOT NULL,
  `NumerPZ` varchar(100) NOT NULL,
  `DataWystawienia` date NOT NULL,
  `Magazyn` int(11) NOT NULL,
  `Zamówienie` int(11) NOT NULL,
  `PodsumowanieNetto` decimal(10,2) NOT NULL,
  `Uwagi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sposobdostawy`
--

CREATE TABLE `sposobdostawy` (
  `IdSposobDostawy` int(11) NOT NULL,
  `SposobDostawy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `sposobdostawy`
--

INSERT INTO `sposobdostawy` (`IdSposobDostawy`, `SposobDostawy`) VALUES
(1, 'Kurier'),
(2, 'OdbiÃ³r Osobisty');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sposobzaplaty`
--

CREATE TABLE `sposobzaplaty` (
  `Idsposobzaplaty` int(11) NOT NULL,
  `sposobzaplaty` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `sposobzaplaty`
--

INSERT INTO `sposobzaplaty` (`Idsposobzaplaty`, `sposobzaplaty`) VALUES
(1, 'gotÃ³wka'),
(2, 'przelew');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `statuszamowienia`
--

CREATE TABLE `statuszamowienia` (
  `IdStanZamowienia` int(11) NOT NULL,
  `Stan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `statuszamowienia`
--

INSERT INTO `statuszamowienia` (`IdStanZamowienia`, `Stan`) VALUES
(1, 'Anulowany'),
(3, 'W trakcie realizacji'),
(2, 'Zrealizowany');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `towar`
--

CREATE TABLE `towar` (
  `IdTowar` int(11) NOT NULL,
  `NazwaTowaru` varchar(100) NOT NULL,
  `MinStanMagazynowy` int(11) NOT NULL,
  `MaxStanMagazynowy` int(11) NOT NULL,
  `StanMagazynowyRzeczywisty` int(11) NOT NULL,
  `StanMagazynowyDysponowany` int(11) NOT NULL,
  `StawkaVat` int(11) NOT NULL,
  `KodTowaru` varchar(100) NOT NULL,
  `IdKategoria` int(11) NOT NULL,
  `IdJednostkaMiary` int(11) NOT NULL,
  `Freeze` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `towar`
--

INSERT INTO `towar` (`IdTowar`, `NazwaTowaru`, `MinStanMagazynowy`, `MaxStanMagazynowy`, `StanMagazynowyRzeczywisty`, `StanMagazynowyDysponowany`, `StawkaVat`, `KodTowaru`, `IdKategoria`, `IdJednostkaMiary`, `Freeze`) VALUES
(1, 'klawiatura', 1, 1, 1, 10, 23, 'a43dv42', 1, 1, 1),
(2, 'gÅ‚oÅ›niki', 1, 1, 1, 10, 23, 'a43dv42', 1, 1, 0),
(3, 'mysz', 1, 1, 1, 10, 8, 'b43dv43', 1, 1, 0),
(4, 'monitor', 2, 2, 2, 20, 8, 'h3h4j1', 1, 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `towarysprzedaz`
--

CREATE TABLE `towarysprzedaz` (
  `id` int(11) NOT NULL,
  `IdTowar` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `klient` int(11) NOT NULL,
  `cena` float NOT NULL,
  `vat` float NOT NULL,
  `IdZamowienieSprzedaz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `IdZamowienie` int(11) NOT NULL,
  `TerminRealizacji` date NOT NULL,
  `DataRealizacji` date DEFAULT NULL,
  `KosztZamowienia` float NOT NULL,
  `IdDostawcy` int(11) NOT NULL,
  `DataWystawienia` date NOT NULL,
  `NumerZamowienia` varchar(50) NOT NULL,
  `IdSposobDostawy` int(11) NOT NULL,
  `KosztDostawy` float NOT NULL,
  `WartoscTowarow` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zamowienie`
--

INSERT INTO `zamowienie` (`IdZamowienie`, `TerminRealizacji`, `DataRealizacji`, `KosztZamowienia`, `IdDostawcy`, `DataWystawienia`, `NumerZamowienia`, `IdSposobDostawy`, `KosztDostawy`, `WartoscTowarow`) VALUES
(1, '2017-03-21', '2017-03-20', 800, 1, '2017-03-20', '2017/03/20/1', 1, 0, 800),
(2, '2017-03-23', '2017-03-22', 1550, 1, '2017-03-22', '2017/03/22/002', 2, 50, 1500);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowieniesprzedaz`
--

CREATE TABLE `zamowieniesprzedaz` (
  `IdZamowienieSprzedaz` int(11) NOT NULL,
  `DataZamowienia` datetime NOT NULL,
  `Wartosc` float NOT NULL,
  `IdStanZamowienia` int(11) NOT NULL,
  `IdKlient` int(11) NOT NULL,
  `IdSposobDostawy` int(11) NOT NULL,
  `IdSposobZaplaty` int(11) NOT NULL,
  `DataWystawienia` date DEFAULT NULL,
  `DataSprzedazy` date DEFAULT NULL,
  `TerminZaplaty` date DEFAULT NULL,
  `NrFaktury` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienietowar`
--

CREATE TABLE `zamowienietowar` (
  `IdZamowienieTowar` int(11) NOT NULL,
  `Lp` int(11) NOT NULL,
  `IdTowar` int(11) NOT NULL,
  `Cena` float NOT NULL,
  `Ilosc` int(11) NOT NULL,
  `WartoscNetto` float NOT NULL,
  `IdZamowienie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zamowienietowar`
--

INSERT INTO `zamowienietowar` (`IdZamowienieTowar`, `Lp`, `IdTowar`, `Cena`, `Ilosc`, `WartoscNetto`, `IdZamowienie`) VALUES
(1, 1, 1, 100, 6, 600, 1),
(2, 2, 2, 200, 2, 400, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienietowarkopia`
--

CREATE TABLE `zamowienietowarkopia` (
  `IdZamowienieTowarKopia` int(11) NOT NULL,
  `Lp` int(11) NOT NULL,
  `IdTowar` int(11) NOT NULL,
  `Cena` float NOT NULL,
  `Ilosc` int(11) NOT NULL,
  `WartoscNetto` float NOT NULL,
  `IdZamowienie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zamowienietowarkopia`
--

INSERT INTO `zamowienietowarkopia` (`IdZamowienieTowarKopia`, `Lp`, `IdTowar`, `Cena`, `Ilosc`, `WartoscNetto`, `IdZamowienie`) VALUES
(1, 1, 1, 100, 6, 600, 1),
(2, 2, 2, 200, 2, 400, 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `cennik`
--
ALTER TABLE `cennik`
  ADD PRIMARY KEY (`idCennik`),
  ADD KEY `idTowar` (`idTowar`);

--
-- Indexes for table `dostawca`
--
ALTER TABLE `dostawca`
  ADD PRIMARY KEY (`IdDostawca`);

--
-- Indexes for table `dostawcatowar`
--
ALTER TABLE `dostawcatowar`
  ADD PRIMARY KEY (`IdDostawcaTowar`),
  ADD KEY `IdDostawca` (`IdDostawca`),
  ADD KEY `IdTowar` (`IdTowar`);

--
-- Indexes for table `jednostkamiary`
--
ALTER TABLE `jednostkamiary`
  ADD PRIMARY KEY (`IdJednostkaMiary`);

--
-- Indexes for table `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`IdKategoria`),
  ADD UNIQUE KEY `NazwaKategorii` (`NazwaKategorii`);

--
-- Indexes for table `Klient`
--
ALTER TABLE `Klient`
  ADD PRIMARY KEY (`IdKlient`);

--
-- Indexes for table `koszyk`
--
ALTER TABLE `koszyk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IdTowar` (`IdTowar`);

--
-- Indexes for table `magazyn`
--
ALTER TABLE `magazyn`
  ADD PRIMARY KEY (`IdMagazyn`);

--
-- Indexes for table `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Indexes for table `pz`
--
ALTER TABLE `pz`
  ADD PRIMARY KEY (`IdPZ`),
  ADD KEY `pz_ibfk_1` (`Magazyn`),
  ADD KEY `pz_ibfk_2` (`Zamówienie`);

--
-- Indexes for table `sposobdostawy`
--
ALTER TABLE `sposobdostawy`
  ADD PRIMARY KEY (`IdSposobDostawy`),
  ADD UNIQUE KEY `SposobDostawy` (`SposobDostawy`);

--
-- Indexes for table `sposobzaplaty`
--
ALTER TABLE `sposobzaplaty`
  ADD PRIMARY KEY (`Idsposobzaplaty`),
  ADD UNIQUE KEY `sposobzaplaty` (`sposobzaplaty`);

--
-- Indexes for table `statuszamowienia`
--
ALTER TABLE `statuszamowienia`
  ADD PRIMARY KEY (`IdStanZamowienia`),
  ADD UNIQUE KEY `Stan` (`Stan`);

--
-- Indexes for table `towar`
--
ALTER TABLE `towar`
  ADD PRIMARY KEY (`IdTowar`),
  ADD KEY `IdKategoria` (`IdKategoria`),
  ADD KEY `IdJednostkaMiary` (`IdJednostkaMiary`);

--
-- Indexes for table `towarysprzedaz`
--
ALTER TABLE `towarysprzedaz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IdTowar` (`IdTowar`),
  ADD KEY `klient` (`klient`),
  ADD KEY `IdZamowienieSprzedaz` (`IdZamowienieSprzedaz`);

--
-- Indexes for table `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`IdZamowienie`),
  ADD KEY `IdDostawcy` (`IdDostawcy`),
  ADD KEY `IdSposobDostawy` (`IdSposobDostawy`);

--
-- Indexes for table `zamowieniesprzedaz`
--
ALTER TABLE `zamowieniesprzedaz`
  ADD PRIMARY KEY (`IdZamowienieSprzedaz`),
  ADD KEY `IdStanZamowienia` (`IdStanZamowienia`),
  ADD KEY `IdSposobDostawy` (`IdSposobDostawy`),
  ADD KEY `IdKlient` (`IdKlient`),
  ADD KEY `IdSposobZaplaty` (`IdSposobZaplaty`);

--
-- Indexes for table `zamowienietowar`
--
ALTER TABLE `zamowienietowar`
  ADD PRIMARY KEY (`IdZamowienieTowar`),
  ADD KEY `IdTowar` (`IdTowar`),
  ADD KEY `IdZamowienie` (`IdZamowienie`);

--
-- Indexes for table `zamowienietowarkopia`
--
ALTER TABLE `zamowienietowarkopia`
  ADD PRIMARY KEY (`IdZamowienieTowarKopia`),
  ADD KEY `IdTowar` (`IdTowar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `cennik`
--
ALTER TABLE `cennik`
  MODIFY `idCennik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `dostawca`
--
ALTER TABLE `dostawca`
  MODIFY `IdDostawca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `dostawcatowar`
--
ALTER TABLE `dostawcatowar`
  MODIFY `IdDostawcaTowar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `jednostkamiary`
--
ALTER TABLE `jednostkamiary`
  MODIFY `IdJednostkaMiary` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `IdKategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `Klient`
--
ALTER TABLE `Klient`
  MODIFY `IdKlient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `magazyn`
--
ALTER TABLE `magazyn`
  MODIFY `IdMagazyn` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `pz`
--
ALTER TABLE `pz`
  MODIFY `IdPZ` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `sposobdostawy`
--
ALTER TABLE `sposobdostawy`
  MODIFY `IdSposobDostawy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `sposobzaplaty`
--
ALTER TABLE `sposobzaplaty`
  MODIFY `Idsposobzaplaty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `statuszamowienia`
--
ALTER TABLE `statuszamowienia`
  MODIFY `IdStanZamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `towar`
--
ALTER TABLE `towar`
  MODIFY `IdTowar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `towarysprzedaz`
--
ALTER TABLE `towarysprzedaz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `IdZamowienie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `zamowieniesprzedaz`
--
ALTER TABLE `zamowieniesprzedaz`
  MODIFY `IdZamowienieSprzedaz` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `zamowienietowar`
--
ALTER TABLE `zamowienietowar`
  MODIFY `IdZamowienieTowar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `zamowienietowarkopia`
--
ALTER TABLE `zamowienietowarkopia`
  MODIFY `IdZamowienieTowarKopia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `cennik`
--
ALTER TABLE `cennik`
  ADD CONSTRAINT `cennik_ibfk_1` FOREIGN KEY (`idTowar`) REFERENCES `towar` (`IdTowar`),
  ADD CONSTRAINT `cennik_ibfk_2` FOREIGN KEY (`idTowar`) REFERENCES `towar` (`IdTowar`);

--
-- Ograniczenia dla tabeli `dostawcatowar`
--
ALTER TABLE `dostawcatowar`
  ADD CONSTRAINT `dostawcatowar_ibfk_1` FOREIGN KEY (`IdDostawca`) REFERENCES `dostawca` (`IdDostawca`) ON DELETE CASCADE,
  ADD CONSTRAINT `dostawcatowar_ibfk_2` FOREIGN KEY (`IdTowar`) REFERENCES `towar` (`IdTowar`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  ADD CONSTRAINT `koszyk_ibfk_1` FOREIGN KEY (`IdTowar`) REFERENCES `towar` (`IdTowar`);

--
-- Ograniczenia dla tabeli `pz`
--
ALTER TABLE `pz`
  ADD CONSTRAINT `pz_ibfk_1` FOREIGN KEY (`Magazyn`) REFERENCES `magazyn` (`IdMagazyn`),
  ADD CONSTRAINT `pz_ibfk_2` FOREIGN KEY (`Zamówienie`) REFERENCES `zamowienie` (`IdZamowienie`);

--
-- Ograniczenia dla tabeli `towar`
--
ALTER TABLE `towar`
  ADD CONSTRAINT `towar_ibfk_1` FOREIGN KEY (`IdKategoria`) REFERENCES `kategoria` (`IdKategoria`),
  ADD CONSTRAINT `towar_ibfk_2` FOREIGN KEY (`IdJednostkaMiary`) REFERENCES `jednostkamiary` (`IdJednostkaMiary`);

--
-- Ograniczenia dla tabeli `towarysprzedaz`
--
ALTER TABLE `towarysprzedaz`
  ADD CONSTRAINT `towarysprzedaz_ibfk_1` FOREIGN KEY (`IdTowar`) REFERENCES `towar` (`IdTowar`),
  ADD CONSTRAINT `towarysprzedaz_ibfk_2` FOREIGN KEY (`klient`) REFERENCES `Klient` (`IdKlient`),
  ADD CONSTRAINT `towarysprzedaz_ibfk_3` FOREIGN KEY (`IdZamowienieSprzedaz`) REFERENCES `zamowieniesprzedaz` (`IdZamowienieSprzedaz`);

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`IdDostawcy`) REFERENCES `dostawca` (`IdDostawca`) ON DELETE CASCADE,
  ADD CONSTRAINT `zamowienie_ibfk_2` FOREIGN KEY (`IdSposobDostawy`) REFERENCES `sposobdostawy` (`IdSposobDostawy`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `zamowieniesprzedaz`
--
ALTER TABLE `zamowieniesprzedaz`
  ADD CONSTRAINT `zamowieniesprzedaz_ibfk_1` FOREIGN KEY (`IdStanZamowienia`) REFERENCES `statuszamowienia` (`IdStanZamowienia`),
  ADD CONSTRAINT `zamowieniesprzedaz_ibfk_2` FOREIGN KEY (`IdSposobDostawy`) REFERENCES `sposobdostawy` (`IdSposobDostawy`),
  ADD CONSTRAINT `zamowieniesprzedaz_ibfk_3` FOREIGN KEY (`IdKlient`) REFERENCES `Klient` (`IdKlient`),
  ADD CONSTRAINT `zamowieniesprzedaz_ibfk_4` FOREIGN KEY (`IdSposobZaplaty`) REFERENCES `sposobzaplaty` (`Idsposobzaplaty`);

--
-- Ograniczenia dla tabeli `zamowienietowar`
--
ALTER TABLE `zamowienietowar`
  ADD CONSTRAINT `zamowienietowar_ibfk_1` FOREIGN KEY (`IdTowar`) REFERENCES `towar` (`IdTowar`) ON DELETE CASCADE,
  ADD CONSTRAINT `zamowienietowar_ibfk_2` FOREIGN KEY (`IdZamowienie`) REFERENCES `zamowienie` (`IdZamowienie`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `zamowienietowarkopia`
--
ALTER TABLE `zamowienietowarkopia`
  ADD CONSTRAINT `zamowienietowarkopia_ibfk_1` FOREIGN KEY (`IdTowar`) REFERENCES `towar` (`IdTowar`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
