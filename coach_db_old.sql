-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: tms_db
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cc_branch`
--

DROP TABLE IF EXISTS `cc_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_branch` (
  `CC_BR_ID` varchar(100) NOT NULL,
  `CC_BR_CENTER_ID` varchar(100) DEFAULT NULL,
  `CC_BR_NM` varchar(100) NOT NULL,
  `CC_BR_ADDRESS` varchar(300) DEFAULT NULL,
  `CC_BR_CITY` varchar(300) NOT NULL,
  `CC_BR_STATE` varchar(100) NOT NULL,
  `CC_BR_PIN` int NOT NULL,
  `CC_BR_COUNTRY` varchar(100) NOT NULL,
  `CC_BR_EMAILID` varchar(200) NOT NULL,
  `CC_BR_CONTACTNO` varchar(100) NOT NULL,
  PRIMARY KEY (`CC_BR_ID`),
  KEY `CC_BR_CENTER_ID` (`CC_BR_CENTER_ID`),
  CONSTRAINT `cc_branch_ibfk_1` FOREIGN KEY (`CC_BR_CENTER_ID`) REFERENCES `mstr_coach_center` (`MC_CENTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `map_stu_sub`
--

DROP TABLE IF EXISTS `map_stu_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_stu_sub` (
  `MSS_ID` varchar(100) NOT NULL,
  `MSS_STU_ID` varchar(100) DEFAULT NULL,
  `MSS_STU_TCHR` varchar(100) DEFAULT NULL,
  `MSS_STU_DOW` varchar(10) DEFAULT NULL,
  `MSS_STU_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MSS_ID`),
  KEY `MSS_STU_ID` (`MSS_STU_ID`),
  KEY `MSS_STU_TCHR` (`MSS_STU_TCHR`),
  CONSTRAINT `map_stu_sub_ibfk_1` FOREIGN KEY (`MSS_STU_ID`) REFERENCES `mstr_stu` (`STU_ID`),
  CONSTRAINT `map_stu_sub_ibfk_2` FOREIGN KEY (`MSS_STU_TCHR`) REFERENCES `map_tchr_sub` (`MTS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `map_tchr_sub`
--

DROP TABLE IF EXISTS `map_tchr_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_tchr_sub` (
  `MTS_ID` varchar(100) NOT NULL,
  `MTS_TCHR_ID` varchar(100) NOT NULL,
  `MTS_SUB` varchar(100) NOT NULL,
  `MTS_BR_ID` varchar(100) NOT NULL,
  PRIMARY KEY (`MTS_ID`),
  KEY `MTS_TCHR_ID` (`MTS_TCHR_ID`),
  KEY `MTS_SUB` (`MTS_SUB`),
  KEY `MTS_BR_ID` (`MTS_BR_ID`),
  CONSTRAINT `map_tchr_sub_ibfk_1` FOREIGN KEY (`MTS_TCHR_ID`) REFERENCES `mstr_teacher` (`TCHR_ID`),
  CONSTRAINT `map_tchr_sub_ibfk_2` FOREIGN KEY (`MTS_SUB`) REFERENCES `mstr_sub` (`SUB_ID`),
  CONSTRAINT `map_tchr_sub_ibfk_3` FOREIGN KEY (`MTS_BR_ID`) REFERENCES `cc_branch` (`CC_BR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mstr_coach_center`
--

DROP TABLE IF EXISTS `mstr_coach_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mstr_coach_center` (
  `MC_CENTER_ID` varchar(100) NOT NULL,
  `MIC_CENTER_NM` varchar(100) NOT NULL,
  `MIC_CENTER_ADDRESS` varchar(300) DEFAULT NULL,
  `MIC_CENTER_CITY` varchar(300) NOT NULL,
  `MIC_CENTER_STATE` varchar(100) NOT NULL,
  `MIC_CENTER_PIN` int NOT NULL,
  `MIC_CENTER_COUNTRY` varchar(100) NOT NULL,
  `MIC_CENTER_EMAILID` varchar(200) NOT NULL,
  `MIC_CENTER_CONTACTNO` varchar(100) NOT NULL,
  PRIMARY KEY (`MC_CENTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mstr_prnt`
--

DROP TABLE IF EXISTS `mstr_prnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mstr_prnt` (
  `PRNT_ID` varchar(100) NOT NULL,
  `PRNT_NM` varchar(100) NOT NULL,
  `PRNT_AADHAR` varchar(12) NOT NULL,
  `PRNT_EMAILID` varchar(100) NOT NULL,
  `PRNT_CONTACTNO` varchar(100) NOT NULL,
  `PRNT_ADDRESS` varchar(300) NOT NULL,
  `PRNT_CITY` varchar(300) NOT NULL,
  `PRNT_STATE` varchar(100) NOT NULL,
  `PRNT_PIN` int NOT NULL,
  `PRNT_COUNTRY` varchar(100) NOT NULL,
  PRIMARY KEY (`PRNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mstr_stu`
--

DROP TABLE IF EXISTS `mstr_stu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mstr_stu` (
  `STU_ID` varchar(100) NOT NULL,
  `STU_NM` varchar(100) NOT NULL,
  `STU_AADHAR` varchar(12) NOT NULL,
  `STU_EMAILID` varchar(100) NOT NULL,
  `STU_CONTACTNO` varchar(100) NOT NULL,
  `STU_ADDRESS` varchar(300) NOT NULL,
  `STU_CITY` varchar(300) NOT NULL,
  `STU_STATE` varchar(100) NOT NULL,
  `STU_PIN` int NOT NULL,
  `STU_COUNTRY` varchar(100) NOT NULL,
  `STU_DOB` date NOT NULL,
  `STU_PRNT_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`STU_ID`),
  KEY `STU_PRNT_ID` (`STU_PRNT_ID`),
  CONSTRAINT `mstr_stu_ibfk_1` FOREIGN KEY (`STU_PRNT_ID`) REFERENCES `mstr_prnt` (`PRNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mstr_sub`
--

DROP TABLE IF EXISTS `mstr_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mstr_sub` (
  `SUB_ID` varchar(100) NOT NULL,
  `SUB_NAME` varchar(100) NOT NULL,
  `SUB_BOARD` varchar(10) NOT NULL,
  `SUB_CLASS` varchar(10) NOT NULL,
  `SUB_LANG` varchar(10) NOT NULL,
  PRIMARY KEY (`SUB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mstr_teacher`
--

DROP TABLE IF EXISTS `mstr_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mstr_teacher` (
  `TCHR_ID` varchar(100) NOT NULL,
  `TCHR_NM` varchar(100) NOT NULL,
  `TCHR_AADHAR` varchar(12) NOT NULL,
  `TCHR_PANCARD` varchar(10) NOT NULL,
  `TCHR_EMAILID` varchar(100) NOT NULL,
  `TCHR_CONTACTNO` varchar(100) NOT NULL,
  `TCHR_ADDRESS` varchar(300) NOT NULL,
  `TCHR_CITY` varchar(300) NOT NULL,
  `TCHR_STATE` varchar(100) NOT NULL,
  `TCHR_PIN` int NOT NULL,
  `TCHR_COUNTRY` varchar(100) NOT NULL,
  PRIMARY KEY (`TCHR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'tms_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-03 20:20:57
