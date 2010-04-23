-- MySQL dump 10.10
--
-- Host: localhost    Database: bwd
-- ------------------------------------------------------
-- Server version	5.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bwd_regions`
--

DROP TABLE IF EXISTS `bwd_regions`;
CREATE TABLE `bwd_regions` (
  `cc` varchar(2) NOT NULL,
  `Region` varchar(255) NOT NULL default '',
  `coast_stations` int(11) NOT NULL,
  `freshwater_stations` int(11) NOT NULL,
  PRIMARY KEY  (`cc`,`Region`),
  KEY `Region` (`Region`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `bwd_stations`
--

DROP TABLE IF EXISTS `bwd_stations`;
CREATE TABLE `bwd_stations` (
  `cc` varchar(2) NOT NULL,
  `BWID` varchar(50) default NULL,
  `numind` varchar(50) NOT NULL,
  `geographic` varchar(255) default NULL,
  `Region` varchar(255) default NULL,
  `Province` varchar(255) default NULL,
  `Commune` varchar(255) default NULL,
  `Prelev` varchar(255) default NULL,
  `WaterType` varchar(10) default NULL,
  `SeaWater` varchar(1) default NULL,
  `Latitude` float default NULL,
  `Longitude` float default NULL,
  `y1990` varchar(2) default NULL,
  `y1991` varchar(2) default NULL,
  `y1992` varchar(2) default NULL,
  `y1993` varchar(2) default NULL,
  `y1994` varchar(2) default NULL,
  `y1995` varchar(2) default NULL,
  `y1996` varchar(2) default NULL,
  `y1997` varchar(2) default NULL,
  `y1998` varchar(2) default NULL,
  `y1999` varchar(2) default NULL,
  `y2000` varchar(2) default NULL,
  `y2001` varchar(2) default NULL,
  `y2002` varchar(2) default NULL,
  `y2003` varchar(2) default NULL,
  `y2004` varchar(2) default NULL,
  `y2005` varchar(2) default NULL,
  `y2006` varchar(2) default NULL,
  `y2007` varchar(2) default NULL,
  `y2008` varchar(2) default NULL,
  `y2009` varchar(2) default NULL,
  `y2009_comment` varchar(255) default NULL,
  `etcw_qa_problems` varchar(255) default NULL,
  `etcw_remarks` varchar(1024) default NULL,
  `ms_remarks` varchar(1024) default NULL,
  PRIMARY KEY  (`numind`,`cc`),
  KEY `cc` (`cc`),
  KEY `y2000` (`y2000`),
  KEY `y2001` (`y2001`),
  KEY `y2002` (`y2002`),
  KEY `y2003` (`y2003`),
  KEY `y2004` (`y2004`),
  KEY `y2005` (`y2005`),
  KEY `y2006` (`y2006`),
  KEY `y2007` (`y2007`),
  KEY `Prelev` (`Prelev`),
  KEY `Commune` (`Commune`),
  KEY `y2008` (`y2008`),
  KEY `y2009` (`y2009`),
  KEY `bwid` (`BWID`),
  KEY `numind` (`numind`),
  KEY `Region` (`Region`),
  KEY `geographic` (`geographic`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `countrycodes_iso`
--

DROP TABLE IF EXISTS `countrycodes_iso`;
CREATE TABLE `countrycodes_iso` (
  `ISO2` varchar(255) NOT NULL default '',
  `Country` varchar(255) default NULL,
  `NationalName` varchar(100) default NULL,
  PRIMARY KEY  (`ISO2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;