CREATE TABLE `board_category` (
  `bc_id` int NOT NULL,
  `bc_name` varchar(20) NOT NULL,
  PRIMARY KEY (`bc_id`)
);

CREATE TABLE `encyclopedia_category` (
  `ec_id` int NOT NULL,
  `ec_name` varchar(20) NOT NULL,
  PRIMARY KEY (`ec_id`)
);

CREATE TABLE `botanical_garden` (
  `g_id` int NOT NULL AUTO_INCREMENT,
  `g_name` varchar(200) NOT NULL,
  `g_detailedAddress` varchar(200) DEFAULT NULL,
  `g_url` varchar(200) DEFAULT NULL,
  `g_summary` varchar(1000) DEFAULT NULL,
  `g_latitude` double DEFAULT NULL,
  `g_longitude` double DEFAULT NULL,
  `g_region` varchar(200) DEFAULT NULL,
  `g_closingDay` varchar(100) DEFAULT NULL,
  `g_fee` varchar(20) DEFAULT NULL,
  `g_openingHours` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`g_id`)
);

CREATE TABLE `user` (
  `u_id` varchar(50) NOT NULL,
  `u_nickname` varchar(50) NOT NULL,
  `u_password` varchar(50) NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `u_email` varchar(100) NOT NULL,
  `u_address` varchar(100) DEFAULT NULL,
  `u_state` int DEFAULT NULL COMMENT '기본회원0어드민99',
  PRIMARY KEY (`u_id`)
);

CREATE TABLE `bookmark` (
  `bm_no` int NOT NULL AUTO_INCREMENT,
  `ec_id` int NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `bm_name` int NOT NULL COMMENT '해충/병해/식물아이디값',
  PRIMARY KEY (`bm_no`),
  KEY `ec_id_idx` (`ec_id`),
  KEY `u_id_idx` (`u_id`),
  CONSTRAINT `bm_ec_id` FOREIGN KEY (`ec_id`) REFERENCES `encyclopedia_category` (`ec_id`),
  CONSTRAINT `bm_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
);

CREATE TABLE `disease` (
  `di_id` int NOT NULL AUTO_INCREMENT,
  `ec_id` int NOT NULL,
  `di_alias` varchar(50) NOT NULL,
  `di_image` varchar(500) DEFAULT NULL,
  `di_cause` varchar(300) DEFAULT NULL,
  `di_symptomOfDisease` varchar(300) DEFAULT NULL,
  `di_biologicalControl` varchar(300) DEFAULT NULL,
  `di_carefulPlant` varchar(100) DEFAULT NULL,
  `di_descripton` varchar(1000) DEFAULT NULL,
  `di_hits` int DEFAULT NULL,
  PRIMARY KEY (`di_id`),
  KEY `ec_id_idx` (`ec_id`),
  CONSTRAINT `di_ec_id` FOREIGN KEY (`ec_id`) REFERENCES `encyclopedia_category` (`ec_id`)
);

CREATE TABLE `modify_request` (
  `mr_no` int NOT NULL AUTO_INCREMENT,
  `ec_id` int NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `mr_name` int DEFAULT NULL,
  `mr_content` varchar(1000) DEFAULT NULL,
  `mr_file` varchar(500) DEFAULT NULL,
  `mr_source` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`mr_no`),
  KEY `ec_id_idx` (`ec_id`),
  KEY `mr_u_id_idx` (`u_id`),
  CONSTRAINT `mr_ec_id` FOREIGN KEY (`ec_id`) REFERENCES `encyclopedia_category` (`ec_id`),
  CONSTRAINT `mr_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
);

CREATE TABLE `pest` (
  `pe_id` int NOT NULL AUTO_INCREMENT COMMENT 'pest_id',
  `ec_id` int NOT NULL,
  `pe_name` varchar(50) NOT NULL,
  `pe_image` varchar(500) DEFAULT NULL,
  `pe_cause` varchar(300) DEFAULT NULL,
  `pe_method` varchar(300) DEFAULT NULL,
  `pe_biologicalControl` varchar(300) DEFAULT NULL,
  `pe_naturalEnemy` varchar(100) DEFAULT NULL,
  `pe_carefulPlant` varchar(100) DEFAULT NULL,
  `pe_description` varchar(1000) DEFAULT NULL,
  `pe_hits` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`pe_id`),
  KEY `pe_ec_id_idx` (`ec_id`),
  CONSTRAINT `pe_ec_id` FOREIGN KEY (`ec_id`) REFERENCES `encyclopedia_category` (`ec_id`)
);

CREATE TABLE `plant` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `ec_id` int NOT NULL,
  `pl_koreanName` varchar(200) NOT NULL,
  `pl_englishName` varchar(200) NOT NULL,
  `pl_scientificName` varchar(200) NOT NULL,
  `pl_familyName` varchar(200) NOT NULL,
  `pl_classification` varchar(200) DEFAULT NULL,
  `pl_nativeHome` varchar(200) DEFAULT NULL,
  `pl_feature` varchar(500) DEFAULT NULL,
  `pl_level` varchar(100) DEFAULT NULL,
  `pl_reproduction` varchar(500) DEFAULT NULL,
  `pl_water` varchar(500) DEFAULT NULL,
  `pl_growthTemperature` varchar(500) DEFAULT NULL,
  `pl_light` varchar(500) DEFAULT NULL,
  `pl_placement` varchar(500) DEFAULT NULL,
  `pl_summary` varchar(500) DEFAULT NULL,
  `pl_tip` varchar(1000) DEFAULT NULL,
  `pl_detailLight` varchar(1000) DEFAULT NULL,
  `pl_detailTemperature` varchar(1000) DEFAULT NULL,
  `pl_detailWater` varchar(1000) DEFAULT NULL,
  `pl_detailReproduction` varchar(1000) DEFAULT NULL,
  `pl_detailSupport` varchar(1000) DEFAULT NULL,
  `pl_detailSoil` varchar(1000) DEFAULT NULL,
  `pl_detailPottingAndRoot` varchar(1000) DEFAULT NULL,
  `pl_detailFertilizer` varchar(1000) DEFAULT NULL,
  `pl_detailCaution` varchar(1000) DEFAULT NULL,
  `pl_image` varchar(1000) DEFAULT NULL,
  `pl_imageSource` varchar(1000) DEFAULT NULL,
  `pl_contentSource` varchar(1000) DEFAULT NULL,
  `pl_hits` int NOT NULL DEFAULT '0',
  `pl_bookmarkCnt` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`pl_id`),
  KEY `pl_ec_id_idx` (`ec_id`),
  CONSTRAINT `pl_ec_id` FOREIGN KEY (`ec_id`) REFERENCES `encyclopedia_category` (`ec_id`)
);

CREATE TABLE `board` (
  `b_no` int NOT NULL AUTO_INCREMENT,
  `bc_id` int NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `b_title` varchar(50) NOT NULL,
  `b_content` varchar(10000) NOT NULL,
  `b_regdate` datetime DEFAULT NULL,
  `b_image` varchar(100) DEFAULT NULL,
  `b_hits` int DEFAULT NULL,
  `b_recommendedNumber` int DEFAULT NULL,
  `b_report` int DEFAULT NULL,
  `b_state` int DEFAULT NULL,
  `b_commentcnt` int DEFAULT NULL,
  PRIMARY KEY (`b_no`),
  KEY `bc_id_idx` (`bc_id`),
  KEY `c_u_id` (`u_id`),
  CONSTRAINT `b_bc_id` FOREIGN KEY (`bc_id`) REFERENCES `board_category` (`bc_id`),
  CONSTRAINT `c_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
);

CREATE TABLE `comment` (
  `c_no` int NOT NULL AUTO_INCREMENT,
  `u_id` varchar(50) NOT NULL,
  `b_no` int NOT NULL,
  `c_content` varchar(3000) NOT NULL,
  `c_regdate` datetime NOT NULL,
  `c_likeCnt` int DEFAULT NULL,
  `c_state` int DEFAULT NULL,
  `c_choose` int DEFAULT NULL,
  `c_report` int DEFAULT NULL,
  PRIMARY KEY (`c_no`),
  KEY `b_no_idx` (`b_no`),
  KEY `fk_comment_user1_idx` (`u_id`),
  CONSTRAINT `c_b_no` FOREIGN KEY (`b_no`) REFERENCES `board` (`b_no`),
  CONSTRAINT `c_u_id2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
);

CREATE TABLE `board_like` (
  `bl_no` int NOT NULL AUTO_INCREMENT,
  `b_no` int NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `bl_content` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bl_no`),
  KEY `b_no_idx` (`b_no`),
  KEY `u_id_idx` (`u_id`),
  CONSTRAINT `bl_b_no` FOREIGN KEY (`b_no`) REFERENCES `board` (`b_no`),
  CONSTRAINT `bl_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
);

CREATE TABLE `report` (
  `r_no` int NOT NULL AUTO_INCREMENT,
  `b_no` int DEFAULT NULL,
  `c_no` int DEFAULT NULL,
  `u_id` varchar(50) NOT NULL,
  `report_user` varchar(50) NOT NULL,
  `rc_content` varchar(3000) DEFAULT NULL,
  `r_content` varchar(3000) DEFAULT NULL,
  `r_file` varchar(45) DEFAULT NULL,
  `r_state` int DEFAULT NULL,
  PRIMARY KEY (`r_no`),
  KEY `r_u_id_idx` (`u_id`),
  CONSTRAINT `r_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
);