/*
 Navicat Premium Data Transfer

 Source Server         : choice
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35-0ubuntu0.22.04.1)
 Source Host           : localhost:3306
 Source Schema         : choice

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35-0ubuntu0.22.04.1)
 File Encoding         : 65001

 Date: 02/03/2024 22:26:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `col_id` int NOT NULL AUTO_INCREMENT,
  `col_name` varchar(255) NOT NULL,
  PRIMARY KEY (`col_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of college
-- ----------------------------
BEGIN;
INSERT INTO `college` (`col_id`, `col_name`) VALUES (1, 'cc');
INSERT INTO `college` (`col_id`, `col_name`) VALUES (2, 'dd');
INSERT INTO `college` (`col_id`, `col_name`) VALUES (3, 'ee');
INSERT INTO `college` (`col_id`, `col_name`) VALUES (4, 'ff');
INSERT INTO `college` (`col_id`, `col_name`) VALUES (5, 'gg ');
INSERT INTO `college` (`col_id`, `col_name`) VALUES (6, 'hh');
INSERT INTO `college` (`col_id`, `col_name`) VALUES (7, 'ii');
INSERT INTO `college` (`col_id`, `col_name`) VALUES (8, 'jj');
INSERT INTO `college` (`col_id`, `col_name`) VALUES (9, 'kk');
INSERT INTO `college` (`col_id`, `col_name`) VALUES (10, 'll');
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cou_id` int NOT NULL AUTO_INCREMENT,
  `cou_name` varchar(255) NOT NULL,
  `cou_credit` int DEFAULT NULL,
  `cou_hour` int DEFAULT NULL,
  `cou_begin_time` date NOT NULL,
  `cou_address` varchar(255) NOT NULL,
  PRIMARY KEY (`cou_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` (`cou_id`, `cou_name`, `cou_credit`, `cou_hour`, `cou_begin_time`, `cou_address`) VALUES (1, '数据库', 3, 2, '2023-09-01', '1号教学楼');
INSERT INTO `course` (`cou_id`, `cou_name`, `cou_credit`, `cou_hour`, `cou_begin_time`, `cou_address`) VALUES (2, '线性代数', 2, 2, '2023-09-01', '1号教学楼');
INSERT INTO `course` (`cou_id`, `cou_name`, `cou_credit`, `cou_hour`, `cou_begin_time`, `cou_address`) VALUES (3, '离散数学', 3, 2, '2023-09-01', '1号教学楼');
INSERT INTO `course` (`cou_id`, `cou_name`, `cou_credit`, `cou_hour`, `cou_begin_time`, `cou_address`) VALUES (4, '大学英语', 3, 2, '2022-09-01', '1号教学楼');
INSERT INTO `course` (`cou_id`, `cou_name`, `cou_credit`, `cou_hour`, `cou_begin_time`, `cou_address`) VALUES (5, 'linux', 3, 2, '2023-09-01', '1号教学楼');
INSERT INTO `course` (`cou_id`, `cou_name`, `cou_credit`, `cou_hour`, `cou_begin_time`, `cou_address`) VALUES (6, '马克思主义原理', 3, 2, '2023-09-01', '1号教学楼');
INSERT INTO `course` (`cou_id`, `cou_name`, `cou_credit`, `cou_hour`, `cou_begin_time`, `cou_address`) VALUES (7, '大学物理', 3, 2, '2022-09-01', '1号教学楼');
COMMIT;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int NOT NULL,
  `password` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of login
-- ----------------------------
BEGIN;
INSERT INTO `login` (`id`, `password`) VALUES (1001, 123123);
INSERT INTO `login` (`id`, `password`) VALUES (1002, 123456);
INSERT INTO `login` (`id`, `password`) VALUES (1003, 123456);
INSERT INTO `login` (`id`, `password`) VALUES (1004, 123456);
INSERT INTO `login` (`id`, `password`) VALUES (1005, 123456);
INSERT INTO `login` (`id`, `password`) VALUES (1006, 123456);
INSERT INTO `login` (`id`, `password`) VALUES (1007, 123456);
INSERT INTO `login` (`id`, `password`) VALUES (1008, 123456);
COMMIT;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `maj_id` int NOT NULL AUTO_INCREMENT,
  `maj_name` varchar(255) NOT NULL,
  PRIMARY KEY (`maj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of major
-- ----------------------------
BEGIN;
INSERT INTO `major` (`maj_id`, `maj_name`) VALUES (1, '计算机');
INSERT INTO `major` (`maj_id`, `maj_name`) VALUES (2, '数学');
INSERT INTO `major` (`maj_id`, `maj_name`) VALUES (5, '穿越时空');
COMMIT;

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `stu_id` int NOT NULL,
  `cou_id` int NOT NULL,
  `tea_id` int NOT NULL,
  `totalscore` int DEFAULT NULL,
  `timescore` int DEFAULT NULL,
  `textscore` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of score
-- ----------------------------
BEGIN;
INSERT INTO `score` (`stu_id`, `cou_id`, `tea_id`, `totalscore`, `timescore`, `textscore`) VALUES (1, 1, 1, 13, 2, 20);
INSERT INTO `score` (`stu_id`, `cou_id`, `tea_id`, `totalscore`, `timescore`, `textscore`) VALUES (1001, 1, 101, NULL, NULL, NULL);
INSERT INTO `score` (`stu_id`, `cou_id`, `tea_id`, `totalscore`, `timescore`, `textscore`) VALUES (1002, 2, 101, NULL, NULL, NULL);
INSERT INTO `score` (`stu_id`, `cou_id`, `tea_id`, `totalscore`, `timescore`, `textscore`) VALUES (1003, 1, 1, 100, 10, 10);
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` int NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `stu_sex` enum('男','女') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `stu_age` int NOT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1112 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` (`stu_id`, `stu_name`, `stu_sex`, `stu_age`) VALUES (1001, '张三', '男', 19);
INSERT INTO `student` (`stu_id`, `stu_name`, `stu_sex`, `stu_age`) VALUES (1002, '李四', '男', 20);
INSERT INTO `student` (`stu_id`, `stu_name`, `stu_sex`, `stu_age`) VALUES (1003, '王五', '女', 20);
INSERT INTO `student` (`stu_id`, `stu_name`, `stu_sex`, `stu_age`) VALUES (1004, '赵六', '男', 21);
INSERT INTO `student` (`stu_id`, `stu_name`, `stu_sex`, `stu_age`) VALUES (1005, '田七', '男', 20);
INSERT INTO `student` (`stu_id`, `stu_name`, `stu_sex`, `stu_age`) VALUES (1006, '晓红', '女', 19);
INSERT INTO `student` (`stu_id`, `stu_name`, `stu_sex`, `stu_age`) VALUES (1007, '晓蓝', '女', 20);
INSERT INTO `student` (`stu_id`, `stu_name`, `stu_sex`, `stu_age`) VALUES (1008, '小九', '男', 10);
COMMIT;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tea_id` int NOT NULL AUTO_INCREMENT,
  `tea_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tea_sex` enum('男','女') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tea_age` int NOT NULL,
  `tea_degree` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`tea_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of teacher
-- ----------------------------
BEGIN;
INSERT INTO `teacher` (`tea_id`, `tea_name`, `tea_sex`, `tea_age`, `tea_degree`) VALUES (101, '王老师', '男', 31, '硕士');
INSERT INTO `teacher` (`tea_id`, `tea_name`, `tea_sex`, `tea_age`, `tea_degree`) VALUES (102, '李老师', '女', 40, '博士');
INSERT INTO `teacher` (`tea_id`, `tea_name`, `tea_sex`, `tea_age`, `tea_degree`) VALUES (103, '赵老师', '女', 35, '硕士');
INSERT INTO `teacher` (`tea_id`, `tea_name`, `tea_sex`, `tea_age`, `tea_degree`) VALUES (104, '张老师', '男', 49, '硕士');
INSERT INTO `teacher` (`tea_id`, `tea_name`, `tea_sex`, `tea_age`, `tea_degree`) VALUES (105, '杨老师', '女', 40, '博士');
INSERT INTO `teacher` (`tea_id`, `tea_name`, `tea_sex`, `tea_age`, `tea_degree`) VALUES (106, '郭老师', '女', 33, '硕士');
INSERT INTO `teacher` (`tea_id`, `tea_name`, `tea_sex`, `tea_age`, `tea_degree`) VALUES (107, '何老师', '男', 36, '硕士');
INSERT INTO `teacher` (`tea_id`, `tea_name`, `tea_sex`, `tea_age`, `tea_degree`) VALUES (108, '张老师', '男', 30, '硕士');
COMMIT;

-- ----------------------------
-- View structure for choice
-- ----------------------------
DROP VIEW IF EXISTS `choice`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `choice` AS select `student`.`stu_id` AS `stu_id`,`student`.`stu_name` AS `stu_name`,`course`.`cou_name` AS `cou_name`,`course`.`cou_begin_time` AS `cou_begin_time`,`course`.`cou_address` AS `cou_address`,`teacher`.`tea_name` AS `tea_name` from (((`student` join `course`) join `teacher`) join `score`) where ((`score`.`stu_id` = `student`.`stu_id`) and (`score`.`cou_id` = `course`.`cou_id`) and (`score`.`tea_id` = `teacher`.`tea_id`));

-- ----------------------------
-- Procedure structure for log_update_password
-- ----------------------------
DROP PROCEDURE IF EXISTS `log_update_password`;
delimiter ;;
CREATE PROCEDURE `log_update_password`(IN stu_id INT ,IN new_password INT)
BEGIN
	UPDATE login SET password=new_password WHERE id=stu_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for score_all
-- ----------------------------
DROP PROCEDURE IF EXISTS `score_all`;
delimiter ;;
CREATE PROCEDURE `score_all`(IN stu_id INT, IN cou_id INT)
BEGIN
    IF cou_id = -1 THEN
        SELECT timescore, textscore, totalscore FROM score WHERE cou_id = cou_id;
    ELSE
        SELECT timescore, textscore, totalscore FROM score WHERE stu_id = stu_id AND cou_id = cou_id;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for score_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `score_insert`;
delimiter ;;
CREATE PROCEDURE `score_insert`(IN stu_id int, IN cou_id INT,IN tea_id INT)
BEGIN
	INSERT INTO score VALUES (stu_id,cou_id,tea_id,NULL,NULL,NULL);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for score_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `score_update`;
delimiter ;;
CREATE PROCEDURE `score_update`(IN stu_id INT, IN cou_id INT ,IN tea_id INT,IN timescore INT ,in textscore INT)
BEGIN
DECLARE totalscore INT;
SET totalscore= 0.4*new.timescore+0.6*new.textscore;
 UPDATE score SET timescore=timescore,textscore=textscore ,totalscore=totalscore WHERE stu_id=stu_id and cou_id=cou_id and tea_id=tea_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for student_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `student_insert`;
delimiter ;;
CREATE PROCEDURE `student_insert`(IN stu_age INT ,IN stu_sex ENUM('男','女'), IN stu_name VARCHAR(255))
BEGIN
	INSERT INTO student(stu_name,stu_sex,stu_age) VALUES(stu_name,stu_sex,stu_age);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for stu_col_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `stu_col_id`;
delimiter ;;
CREATE PROCEDURE `stu_col_id`(IN stu_name VARCHAR(255),OUT id_str VARCHAR(255))
BEGIN 
	DECLARE id INT;
	DECLARE id_str VARCHAR(255);
	SELECT stu_id INTO id FROM student WHERE stu_name=stu_name LIMIT 1;
	IF id IS not null THEN
		set id_str=CAST(id AS char);
	ELSE
		SET id_str='0';
	end if;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for stu_score
-- ----------------------------
DROP PROCEDURE IF EXISTS `stu_score`;
delimiter ;;
CREATE PROCEDURE `stu_score`(IN down INT , IN up INT)
BEGIN
    SELECT student.stu_id, student.stu_name, score.totalscore, score.timescore, score.textscore FROM student INNER JOIN score ON student.stu_id = score.stu_id
WHERE score.totalscore >= down AND score.totalscore <= up;
select down,up;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for teacher_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `teacher_insert`;
delimiter ;;
CREATE PROCEDURE `teacher_insert`(IN tea_age INT ,IN tea_sec ENUM('男','女'), IN tea_name VARCHAR(255) ,IN tea_degree VARCHAR(255))
BEGIN
	INSERT INTO teacher(tea_name,tea_sec,tea_age,tea_degree) VALUES(tea_name,tea_sec,tea_age,tea_degree);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table score
-- ----------------------------
DROP TRIGGER IF EXISTS `totalscore_update`;
delimiter ;;
CREATE TRIGGER `totalscore_update` BEFORE UPDATE ON `score` FOR EACH ROW BEGIN
	declare total int;
	set total=new.timescore*0.4+new.textscore*0.6;
	if total<=100 and total>=0 then
		set new.totalscore=total;
	else  
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Total score must be between 0 and 100';
	end if;
	END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `log_id`;
delimiter ;;
CREATE TRIGGER `log_id` AFTER INSERT ON `student` FOR EACH ROW BEGIN
	INSERT INTO login (id,password) VALUES (new.stu_id,'123456');
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
