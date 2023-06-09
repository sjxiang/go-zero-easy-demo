
CREATE DATABASE IF NOT EXISTS `mall` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `mall`;

DROP TABLE IF EXISTS `user`;

-- 用户表结构设计
CREATE TABLE `user` (
    `id`          bigint unsigned     NOT NULL AUTO_INCREMENT,
    `name`        varchar(255)        NOT NULL DEFAULT ''  COMMENT '用户姓名',
    `gender`      tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户性别',
    `mobile`      varchar(255)        NOT NULL DEFAULT ''  COMMENT '用户电话',
    `password`    varchar(255)        NOT NULL DEFAULT ''  COMMENT '用户密码',
    `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mobile_unique` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

