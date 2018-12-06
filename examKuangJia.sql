/*
SQLyog Ultimate v8.32 
MySQL - 5.5.48 : Database - exam
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`exam` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `exam`;

/*Table structure for table `classandteacher` */

DROP TABLE IF EXISTS `classandteacher`;

CREATE TABLE `classandteacher` (
  `ctid` int(11) NOT NULL AUTO_INCREMENT,
  `teacherId` int(11) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ctid`),
  KEY `FK_classandteacher` (`classId`),
  CONSTRAINT `FK_classandteacher` FOREIGN KEY (`classId`) REFERENCES `classinfo` (`classId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

/*Table structure for table `classinfo` */

DROP TABLE IF EXISTS `classinfo`;

CREATE TABLE `classinfo` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Table structure for table `courseinfo` */

DROP TABLE IF EXISTS `courseinfo`;

CREATE TABLE `courseinfo` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(20) DEFAULT NULL,
  `teacherId` int(11) DEFAULT NULL,
  PRIMARY KEY (`courseId`),
  KEY `FK_courseTeacher` (`teacherId`),
  CONSTRAINT `FK_courseTeacher` FOREIGN KEY (`teacherId`) REFERENCES `teacherinfo` (`teacherId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `examplaninfo` */

DROP TABLE IF EXISTS `examplaninfo`;

CREATE TABLE `examplaninfo` (
  `examplanId` int(11) NOT NULL AUTO_INCREMENT,
  `paperId` int(11) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `overTime` date DEFAULT NULL,
  `examState` int(11) DEFAULT '0' COMMENT '0,1,2',
  PRIMARY KEY (`examplanId`),
  KEY `FK_examplanPaper` (`paperId`),
  KEY `FK_examplanClass` (`classId`),
  CONSTRAINT `FK_examplanClass` FOREIGN KEY (`classId`) REFERENCES `classinfo` (`classId`) ON DELETE NO ACTION,
  CONSTRAINT `FK_examplanPaper` FOREIGN KEY (`paperId`) REFERENCES `paperinfo` (`paperId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Table structure for table `paperinfo` */

DROP TABLE IF EXISTS `paperinfo`;

CREATE TABLE `paperinfo` (
  `paperId` int(11) NOT NULL AUTO_INCREMENT,
  `paperName` varchar(20) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  `isAdd` int(11) DEFAULT '0',
  PRIMARY KEY (`paperId`),
  KEY `FK_paperCourse` (`courseId`),
  CONSTRAINT `FK_paperCourse` FOREIGN KEY (`courseId`) REFERENCES `courseinfo` (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Table structure for table `resultinfo` */

DROP TABLE IF EXISTS `resultinfo`;

CREATE TABLE `resultinfo` (
  `resultId` int(11) NOT NULL AUTO_INCREMENT,
  `paperId` int(11) DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL,
  `titleCat` int(11) DEFAULT NULL,
  `titleId` int(11) DEFAULT NULL,
  `studentAnswer` varchar(500) DEFAULT NULL,
  `correctState` int(11) DEFAULT '0' COMMENT '0,1',
  PRIMARY KEY (`resultId`),
  KEY `FK_resultPaper` (`paperId`),
  KEY `FK_resultStudent` (`studentId`),
  KEY `FK_resultTitle` (`titleId`),
  CONSTRAINT `FK_resultPaper` FOREIGN KEY (`paperId`) REFERENCES `paperinfo` (`paperId`),
  CONSTRAINT `FK_resultStudent` FOREIGN KEY (`studentId`) REFERENCES `studentinfo` (`studentId`),
  CONSTRAINT `FK_resultTitle` FOREIGN KEY (`titleId`) REFERENCES `titleinfo` (`titleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `scoreinfo` */

DROP TABLE IF EXISTS `scoreinfo`;

CREATE TABLE `scoreinfo` (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) DEFAULT NULL,
  `paperId` int(11) DEFAULT NULL,
  `objectSco` int(11) DEFAULT NULL,
  `subjectSco` int(11) DEFAULT NULL,
  `sumSco` int(11) DEFAULT NULL,
  PRIMARY KEY (`scoreId`),
  KEY `FK_scoreStudent` (`studentId`),
  KEY `FK_scorePaper` (`paperId`),
  CONSTRAINT `FK_scorePaper` FOREIGN KEY (`paperId`) REFERENCES `paperinfo` (`paperId`),
  CONSTRAINT `FK_scoreStudent` FOREIGN KEY (`studentId`) REFERENCES `studentinfo` (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8;

/*Table structure for table `studentinfo` */

DROP TABLE IF EXISTS `studentinfo`;

CREATE TABLE `studentinfo` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(20) DEFAULT NULL,
  `studentPwd` varchar(20) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  KEY `Fk_classStudent` (`classId`),
  CONSTRAINT `Fk_classStudent` FOREIGN KEY (`classId`) REFERENCES `classinfo` (`classId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=150965 DEFAULT CHARSET=utf8;

/*Table structure for table `studentstate` */

DROP TABLE IF EXISTS `studentstate`;

CREATE TABLE `studentstate` (
  `stateId` int(11) NOT NULL AUTO_INCREMENT,
  `paperId` int(11) DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL,
  `stateFlag` int(11) DEFAULT '0' COMMENT '0,1,2',
  PRIMARY KEY (`stateId`),
  KEY `FK_studentstatePaper` (`paperId`),
  KEY `FK_studentstateStudent` (`studentId`),
  CONSTRAINT `FK_studentstatePaper` FOREIGN KEY (`paperId`) REFERENCES `paperinfo` (`paperId`),
  CONSTRAINT `FK_studentstateStudent` FOREIGN KEY (`studentId`) REFERENCES `studentinfo` (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `teacherinfo` */

DROP TABLE IF EXISTS `teacherinfo`;

CREATE TABLE `teacherinfo` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `teacherName` varchar(20) DEFAULT NULL,
  `teacherPwd` varchar(20) DEFAULT NULL,
  `isAdmin` int(11) DEFAULT '0' COMMENT '0,1',
  `joindate` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8;

/*Table structure for table `titleinfo` */

DROP TABLE IF EXISTS `titleinfo`;

CREATE TABLE `titleinfo` (
  `titleId` int(11) NOT NULL AUTO_INCREMENT,
  `titleCat` int(11) DEFAULT NULL,
  `titleStem` varchar(500) DEFAULT NULL,
  `optionA` varchar(500) DEFAULT NULL,
  `optionB` varchar(500) DEFAULT NULL,
  `optionC` varchar(500) DEFAULT NULL,
  `optionD` varchar(500) DEFAULT NULL,
  `answerRight` varchar(500) DEFAULT NULL,
  `answerScore` int(11) DEFAULT NULL,
  `analyze` varchar(500) DEFAULT NULL,
  `paperId` int(11) DEFAULT NULL,
  PRIMARY KEY (`titleId`),
  KEY `FK_titlePaper` (`paperId`),
  CONSTRAINT `FK_titlePaper` FOREIGN KEY (`paperId`) REFERENCES `paperinfo` (`paperId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
