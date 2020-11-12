-- --------------------------------------------------------
-- 호스트:                          localhost
-- 서버 버전:                        10.3.26-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- pro17 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `pro17` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pro17`;

-- 테이블 pro17.t_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_member` (
  `id` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `joinDate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pro17.t_member:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_member` DISABLE KEYS */;
INSERT INTO `t_member` (`id`, `pwd`, `name`, `email`, `joinDate`) VALUES
	('jnwon', 'qwer1234', 'Jongnam Won', 'jnwon@gmail.com', '2020-11-11'),
	('dambi', 'dambi1234', 'Dambi Yu', 'dambi@gmail.com', '2020-11-11'),
	('finn', 'finn1234', 'Finn Jo', 'finn@gmail.com', '2020-11-11'),
	('benedict', 'benedict1234', 'Benedict Gil', 'benedict@gmail.com', '2020-11-11'),
	('emilia', 'emilia 1234', 'Emilia Sim', 'emilia@gmail.com', '2020-11-11');
/*!40000 ALTER TABLE `t_member` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
