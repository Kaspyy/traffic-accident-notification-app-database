/*
 Navicat Premium Data Transfer

 Source Server         : mariadb
 Source Server Type    : MariaDB
 Source Server Version : 100509
 Source Host           : localhost:3306
 Source Schema         : projekt

 Target Server Type    : MariaDB
 Target Server Version : 100509
 File Encoding         : 65001

 Date: 30/07/2021 11:40:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for miejsce
-- ----------------------------
DROP TABLE IF EXISTS `miejsce`;
CREATE TABLE `miejsce`  (
  `ID_Miejsca` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Wojewodztwo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Powiat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Miejscowosc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Miejsca`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for osrodek
-- ----------------------------
DROP TABLE IF EXISTS `osrodek`;
CREATE TABLE `osrodek`  (
  `ID_Osrodek` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_Typ_Osrodku` int(11) UNSIGNED NULL DEFAULT NULL,
  `Nazwa_Osrodku` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_Ulicy` int(11) UNSIGNED NULL DEFAULT NULL,
  `Nr_Budynku` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `E-mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Telefon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Osrodek`) USING BTREE,
  INDEX `ID_Typ_Osrodku`(`ID_Typ_Osrodku`) USING BTREE,
  INDEX `ID_Ulicy`(`ID_Ulicy`) USING BTREE,
  CONSTRAINT `osrodek_ibfk_1` FOREIGN KEY (`ID_Typ_Osrodku`) REFERENCES `typ_osrodka` (`ID_Typ_Osrodka`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `osrodek_ibfk_2` FOREIGN KEY (`ID_Ulicy`) REFERENCES `ulice` (`ID_Ulicy`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pojazdy
-- ----------------------------
DROP TABLE IF EXISTS `pojazdy`;
CREATE TABLE `pojazdy`  (
  `ID_Pojazdu` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_Rozkladu` int(11) UNSIGNED NULL DEFAULT NULL,
  `Nr_Autobusu` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Pojazdu`) USING BTREE,
  INDEX `ID_Rozkladu`(`ID_Rozkladu`) USING BTREE,
  CONSTRAINT `pojazdy_ibfk_1` FOREIGN KEY (`ID_Rozkladu`) REFERENCES `rozklad_jazdy` (`ID_Rozkladu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for przystanek
-- ----------------------------
DROP TABLE IF EXISTS `przystanek`;
CREATE TABLE `przystanek`  (
  `ID_Przystanku` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nazwa_Przystanku` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_Ulicy` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Przystanku`) USING BTREE,
  INDEX `ID_Ulicy`(`ID_Ulicy`) USING BTREE,
  CONSTRAINT `przystanek_ibfk_1` FOREIGN KEY (`ID_Ulicy`) REFERENCES `ulice` (`ID_Ulicy`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for przystanek_trasa
-- ----------------------------
DROP TABLE IF EXISTS `przystanek_trasa`;
CREATE TABLE `przystanek_trasa`  (
  `ID_Przystanku` int(11) UNSIGNED NULL DEFAULT NULL,
  `ID_Trasa` int(11) UNSIGNED NULL DEFAULT NULL,
  INDEX `ID_Przystanku`(`ID_Przystanku`) USING BTREE,
  INDEX `ID_Trasa`(`ID_Trasa`) USING BTREE,
  CONSTRAINT `przystanek_trasa_ibfk_1` FOREIGN KEY (`ID_Przystanku`) REFERENCES `przystanek` (`ID_Przystanku`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `przystanek_trasa_ibfk_2` FOREIGN KEY (`ID_Trasa`) REFERENCES `trasa` (`ID_Trasa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rozklad_jazdy
-- ----------------------------
DROP TABLE IF EXISTS `rozklad_jazdy`;
CREATE TABLE `rozklad_jazdy`  (
  `ID_Rozkladu` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_Trasy` int(11) UNSIGNED NULL DEFAULT NULL,
  `Wyjazd` time NULL DEFAULT NULL,
  `Przyjazd` time NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Rozkladu`) USING BTREE,
  INDEX `ID_Trasy`(`ID_Trasy`) USING BTREE,
  CONSTRAINT `rozklad_jazdy_ibfk_1` FOREIGN KEY (`ID_Trasy`) REFERENCES `trasa` (`ID_Trasa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trasa
-- ----------------------------
DROP TABLE IF EXISTS `trasa`;
CREATE TABLE `trasa`  (
  `ID_Trasa` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Numer_linii` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Trasa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for typ_osrodka
-- ----------------------------
DROP TABLE IF EXISTS `typ_osrodka`;
CREATE TABLE `typ_osrodka`  (
  `ID_Typ_Osrodka` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nazwa_Osrodka` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Typ_Osrodka`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ulice
-- ----------------------------
DROP TABLE IF EXISTS `ulice`;
CREATE TABLE `ulice`  (
  `ID_Ulicy` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nazwa_Ulicy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_Miejsca` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Ulicy`) USING BTREE,
  INDEX `ID_Miejsca`(`ID_Miejsca`) USING BTREE,
  CONSTRAINT `ulice_ibfk_1` FOREIGN KEY (`ID_Miejsca`) REFERENCES `miejsce` (`ID_Miejsca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for uzytkownik
-- ----------------------------
DROP TABLE IF EXISTS `uzytkownik`;
CREATE TABLE `uzytkownik`  (
  `ID_Uzytkownika` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Imie` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Nazwisko` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Login` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Haslo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `E-mail` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Telefon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Data_dolaczenia` date NOT NULL,
  `Weryfikacja` tinyint(1) NULL DEFAULT NULL,
  `Liczba_postow` int(255) NULL DEFAULT NULL,
  `Ile_dni_aktywny` int(11) GENERATED ALWAYS AS (to_days(curdate()) - to_days(`Data_dolaczenia`)) VIRTUAL,
  PRIMARY KEY (`ID_Uzytkownika`, `Data_dolaczenia`) USING BTREE,
  UNIQUE INDEX `Login`(`Login`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wspolrzedne
-- ----------------------------
DROP TABLE IF EXISTS `wspolrzedne`;
CREATE TABLE `wspolrzedne`  (
  `ID_Wspolrzednych` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Wspolrzedna_N` double NULL DEFAULT NULL,
  `Wspolrzedna_E` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Wspolrzednych`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wypadek
-- ----------------------------
DROP TABLE IF EXISTS `wypadek`;
CREATE TABLE `wypadek`  (
  `ID_Wypadku` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Tytul` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Opis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_Miejsce` int(11) UNSIGNED NULL DEFAULT NULL,
  `ID_Wspolrzedne` int(11) UNSIGNED NULL DEFAULT NULL,
  `Data` datetime NULL DEFAULT NULL,
  `Przejazd` tinyint(1) NULL DEFAULT NULL,
  `Utrudnienia` tinyint(1) NULL DEFAULT NULL,
  `Zagrozenia` tinyint(1) NULL DEFAULT NULL,
  `ID_Uzytkownika` int(11) UNSIGNED NULL DEFAULT NULL,
  `Weryfikacja` tinyint(1) NULL DEFAULT NULL,
  `Czy_Swiadek` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Wypadku`, `row_end`) USING BTREE,
  INDEX `ID_Uzytkownika`(`ID_Uzytkownika`) USING BTREE,
  INDEX `ID_Miejsce`(`ID_Miejsce`) USING BTREE,
  INDEX `ID_Wspolrzedne`(`ID_Wspolrzedne`) USING BTREE,
  FULLTEXT INDEX `Tytul`(`Tytul`),
  CONSTRAINT `wypadek_ibfk_1` FOREIGN KEY (`ID_Uzytkownika`) REFERENCES `uzytkownik` (`ID_Uzytkownika`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wypadek_ibfk_2` FOREIGN KEY (`ID_Miejsce`) REFERENCES `miejsce` (`ID_Miejsca`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wypadek_ibfk_3` FOREIGN KEY (`ID_Wspolrzedne`) REFERENCES `wspolrzedne` (`ID_Wspolrzednych`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zdjecie
-- ----------------------------
DROP TABLE IF EXISTS `zdjecie`;
CREATE TABLE `zdjecie`  (
  `ID_Zdjecia` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Zdjecie_Postu` binary(1) NULL DEFAULT NULL,
  `ID_Wypadku` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Zdjecia`) USING BTREE,
  INDEX `ID_Wypadku`(`ID_Wypadku`) USING BTREE,
  CONSTRAINT `zdjecie_ibfk_1` FOREIGN KEY (`ID_Wypadku`) REFERENCES `wypadek` (`ID_Wypadku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for vbezwypadkowe_miejsca
-- ----------------------------
DROP VIEW IF EXISTS `vbezwypadkowe_miejsca`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vbezwypadkowe_miejsca` AS SELECT
ID_Miejsca 
FROM
	miejsce EXCEPT
SELECT
	ID_Miejsce 
FROM
	wypadek ;

-- ----------------------------
-- View structure for vile_wypadkow_w_miejscu
-- ----------------------------
DROP VIEW IF EXISTS `vile_wypadkow_w_miejscu`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vile_wypadkow_w_miejscu` AS SELECT
	tab.ID_Miejsca,
	(COUNT(*) - 1) AS liczba_wypadkow
FROM(
SELECT
	ID_Miejsca 
FROM
	miejsce
UNION ALL
SELECT
	ID_Miejsce 
FROM
	wypadek) AS tab
GROUP BY ID_Miejsca
ORDER BY ID_Miejsca ;

-- ----------------------------
-- View structure for vloginy_imiona_nazwiska_uzytkownikow
-- ----------------------------
DROP VIEW IF EXISTS `vloginy_imiona_nazwiska_uzytkownikow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vloginy_imiona_nazwiska_uzytkownikow` AS SELECT
	Login,
	CONCAT(Imie, ' ', Nazwisko) AS imie_i_nazwisko
FROM
	uzytkownik ;

-- ----------------------------
-- View structure for vnajlepsi_uzytkownicy
-- ----------------------------
DROP VIEW IF EXISTS `vnajlepsi_uzytkownicy`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vnajlepsi_uzytkownicy` AS SELECT
Imie,
Nazwisko,
Liczba_postow 
FROM
	uzytkownik 
WHERE
	Liczba_postow = ANY ( SELECT Liczba_postow FROM uzytkownik WHERE Liczba_postow > 0 ) 
ORDER BY
	Liczba_postow DESC ;

-- ----------------------------
-- View structure for vniezweryfikowani_uzytkownicy_z_postami
-- ----------------------------
DROP VIEW IF EXISTS `vniezweryfikowani_uzytkownicy_z_postami`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vniezweryfikowani_uzytkownicy_z_postami` AS SELECT
* 
FROM
	uzytkownik 
WHERE
	EXISTS ( SELECT * FROM uzytkownik NATURAL JOIN wypadek WHERE uzytkownik.ID_Uzytkownika = wypadek.ID_Uzytkownika ) 
	AND Liczba_postow > 0 
	AND Weryfikacja = 0 ;

-- ----------------------------
-- View structure for vposty_uzytkownikow
-- ----------------------------
DROP VIEW IF EXISTS `vposty_uzytkownikow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vposty_uzytkownikow` AS SELECT
Imie,
Nazwisko,
Tytul,
Opis,
`Data` 
FROM
	uzytkownik
	NATURAL JOIN wypadek ;

-- ----------------------------
-- View structure for vprzystanki_na_trasach
-- ----------------------------
DROP VIEW IF EXISTS `vprzystanki_na_trasach`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vprzystanki_na_trasach` AS SELECT
	ID_Trasa,
	Nazwa_Przystanku 
FROM
	przystanek_trasa
	NATURAL JOIN przystanek
	NATURAL JOIN trasa 
GROUP BY
	ID_Trasa,
	ID_Przystanku ;

-- ----------------------------
-- View structure for vprzystanki_ulice_krakow
-- ----------------------------
DROP VIEW IF EXISTS `vprzystanki_ulice_krakow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vprzystanki_ulice_krakow` AS SELECT
Nazwa_Przystanku,
Nazwa_Ulicy 
FROM
	przystanek
	NATURAL JOIN ulice
	NATURAL JOIN miejsce 
WHERE
	Miejscowosc = 'Krakow' ;

-- ----------------------------
-- View structure for vprzystanki_ulice_przemysl
-- ----------------------------
DROP VIEW IF EXISTS `vprzystanki_ulice_przemysl`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vprzystanki_ulice_przemysl` AS SELECT
Nazwa_Przystanku,
Nazwa_Ulicy 
FROM
	przystanek
	NATURAL JOIN ulice
	NATURAL JOIN miejsce 
WHERE
	Miejscowosc IN (
	'Przemyśl' 
	) ;

-- ----------------------------
-- View structure for vsrednia_liczba_postow
-- ----------------------------
DROP VIEW IF EXISTS `vsrednia_liczba_postow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vsrednia_liczba_postow` AS SELECT
ROUND( AVG( Liczba_postow ) ) AS srednia_liczba_postow 
FROM
	uzytkownik ;

-- ----------------------------
-- View structure for vstatystyka_najelpszych_uzytkownikow
-- ----------------------------
DROP VIEW IF EXISTS `vstatystyka_najelpszych_uzytkownikow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vstatystyka_najelpszych_uzytkownikow` AS SELECT
Imie,
Nazwisko,
Liczba_postow 
FROM
	uzytkownik 
HAVING
	Liczba_postow > 0 
ORDER BY
	Liczba_postow DESC ;

-- ----------------------------
-- View structure for vstatystyka_wypadkow_wedlug_miast
-- ----------------------------
DROP VIEW IF EXISTS `vstatystyka_wypadkow_wedlug_miast`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vstatystyka_wypadkow_wedlug_miast` AS SELECT
	Miejscowosc,
	COUNT( Miejscowosc ) AS liczba_wypadkow 
FROM
	wypadek
	JOIN miejsce ON wypadek.ID_Miejsce = miejsce.ID_Miejsca
GROUP BY
	Miejscowosc ;

-- ----------------------------
-- View structure for vtypy_osrodkow
-- ----------------------------
DROP VIEW IF EXISTS `vtypy_osrodkow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vtypy_osrodkow` AS SELECT
*
FROM
	typ_osrodka ;

-- ----------------------------
-- View structure for vuzytkownicy
-- ----------------------------
DROP VIEW IF EXISTS `vuzytkownicy`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vuzytkownicy` AS SELECT
* 
FROM
	uzytkownik ;

-- ----------------------------
-- View structure for vwspolrzedne_wypadkow
-- ----------------------------
DROP VIEW IF EXISTS `vwspolrzedne_wypadkow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vwspolrzedne_wypadkow` AS SELECT
Tytul,
Wspolrzedna_N,
Wspolrzedna_E 
FROM
	wypadek
	LEFT OUTER JOIN wspolrzedne ON wypadek.ID_Wspolrzedne = wspolrzedne.ID_Wspolrzednych ;

-- ----------------------------
-- View structure for vwypadki
-- ----------------------------
DROP VIEW IF EXISTS `vwypadki`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vwypadki` AS SELECT
*
FROM
	wypadek ;

-- ----------------------------
-- View structure for vwypadki_w_marcu_2021
-- ----------------------------
DROP VIEW IF EXISTS `vwypadki_w_marcu_2021`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vwypadki_w_marcu_2021` AS SELECT
	Tytul,
	DATE(`Data`)
FROM
	wypadek
WHERE
	MONTH(`Data`) = 3 ;

-- ----------------------------
-- View structure for vzarejestrowane_osordki
-- ----------------------------
DROP VIEW IF EXISTS `vzarejestrowane_osordki`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vzarejestrowane_osordki` AS SELECT
Nazwa_Osrodku,
Nazwa_Osrodka 
FROM
	osrodek
	LEFT JOIN typ_osrodka ON typ_osrodka.ID_Typ_Osrodka = osrodek.ID_Typ_Osrodku INTERSECT
SELECT
	Nazwa_Osrodku,
	Nazwa_Osrodka 
FROM
	osrodek
	RIGHT JOIN typ_osrodka ON typ_osrodka.ID_Typ_Osrodka = osrodek.ID_Typ_Osrodku ;

-- ----------------------------
-- View structure for vzdjecia_wypadkow
-- ----------------------------
DROP VIEW IF EXISTS `vzdjecia_wypadkow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vzdjecia_wypadkow` AS SELECT
	Tytul,
	Zdjecie_Postu 
FROM
	wypadek
	JOIN zdjecie USING ( ID_Wypadku ) ;

-- ----------------------------
-- View structure for vzweryfikowani_uzytkownicy
-- ----------------------------
DROP VIEW IF EXISTS `vzweryfikowani_uzytkownicy`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vzweryfikowani_uzytkownicy` AS SELECT
Imie,
Nazwisko 
FROM
	uzytkownik 
WHERE
	Weryfikacja = ALL ( SELECT Weryfikacja FROM uzytkownik WHERE Weryfikacja != 0 ) ;

-- ----------------------------
-- Procedure structure for add_osrodek
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_osrodek`;
delimiter ;;
CREATE PROCEDURE `add_osrodek`(IN vid_o INT,
	IN vid_to INT,
	IN vnazwa_o VARCHAR ( 100 ),
	IN vid_u INT,
	IN vnr_b VARCHAR (30),
	IN vemail VARCHAR ( 100 ),
	IN vtelefon VARCHAR ( 100 ))
BEGIN
	
	SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
	START TRANSACTION;
	
	SET @czy_jest_osrodek = 0;
	SELECT
		count(*) INTO @czy_jest_osrodek
	FROM
		osrodek 
	WHERE
		ID_Typ_Osrodku = vid_to 
		AND vid_u = ID_Ulicy 
		AND Nr_budynku = vnr_b COLLATE utf8_polish_ci
		AND Nazwa_Osrodku = vnazwa_o COLLATE utf8_polish_ci FOR UPDATE;
	IF
		( @czy_jest_osrodek = 0 ) THEN
			INSERT INTO osrodek
		VALUES
			( vid_o, vid_to, vnazwa_o, vid_u, vnr_b, vemail, vtelefon );
		COMMIT;
		ELSE ROLLBACK;
		SIGNAL SQLSTATE '45000' 
		SET MYSQL_ERRNO = 30001,
		MESSAGE_TEXT = 'Ten osrodek istnieje już w bazie';
		
	END IF;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for Srednia_wypadkow_na_dzien
-- ----------------------------
DROP FUNCTION IF EXISTS `Srednia_wypadkow_na_dzien`;
delimiter ;;
CREATE FUNCTION `Srednia_wypadkow_na_dzien`(`data` datetime)
 RETURNS double
BEGIN
	DECLARE suma INT DEFAULT 0;
	DECLARE data_min datetime DEFAULT CURRENT_DATE;
	DECLARE ile_dni INT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR NOT FOUND RETURN suma/ile_dni;
	
	LOOP
	
		FETCH GROUP NEXT ROW;
		SET suma = suma + 1;
		
		IF (TO_DAYS(`data`) < TO_DAYS(data_min)) THEN
			SET data_min = `data`;
		END IF;
		
	SET ile_dni = TO_DAYS(CURRENT_DATE) - TO_DAYS(data_min);
	
	END LOOP;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for znajdz_wypadek
-- ----------------------------
DROP PROCEDURE IF EXISTS `znajdz_wypadek`;
delimiter ;;
CREATE PROCEDURE `znajdz_wypadek`(IN vtekst VARCHAR ( 255 ))
BEGIN
	SELECT
		* 
	FROM
		wypadek 
	WHERE
		MATCH ( Tytul ) against ( vtekst IN boolean MODE );

END
;;
delimiter ;

-- ----------------------------
-- Event structure for nowa_partycja
-- ----------------------------
DROP EVENT IF EXISTS `nowa_partycja`;
delimiter ;;
CREATE EVENT `nowa_partycja`
ON SCHEDULE
EVERY '1' YEAR STARTS '2021-05-26 20:41:26'
ON COMPLETION PRESERVE
DO BEGIN

SET @nowy_rok = YEAR(now()) + 1;
SET @sql = CONCAT("alter table uzytkownik REORGANIZE PARTITION najnowsze into PARTITION p_", @nowy_rok, " VALUES less than (", (@nowy_rok + 1), "),\r\n PARTITION najnowsze VALUES less than MAXVALUE);");
 
 PREPARE st1 FROM @sql;
 EXECUTE st1;
 DEALLOCATE PREPARE st1;
 
 end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table uzytkownik
-- ----------------------------
DROP TRIGGER IF EXISTS `code_password_before_insert`;
delimiter ;;
CREATE TRIGGER `code_password_before_insert` BEFORE INSERT ON `uzytkownik` FOR EACH ROW BEGIN
	DECLARE
		coded_password VARCHAR ( 30 );
	DECLARE
		i INT;
	DECLARE
		dl INT;
	
	SET dl = LENGTH( NEW.Haslo );
	
	SET i = 1;
	
	SET coded_password = "";
	WHILE
			( i <= dl ) DO
			
			SET coded_password := concat(
				coded_password,
				CONVERT (
					hex(
					substring( NEW.Haslo, i, 1 )),
				VARCHAR ( 2 )));
		
		SET i = i + 1;
		
	END WHILE;
	
SET NEW.Haslo = coded_password;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
