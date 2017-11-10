CREATE TABLE IF NOT EXISTS `game`(
   `id` INT UNSIGNED AUTO_INCREMENT,
   `name` VARCHAR(100) NOT NULL,
   `intro` VARCHAR(1000) NOT NULL,
   `img` VARCHAR(1000) NOT NULL,
   `game_id` INT NOT NULL,
   PRIMARY KEY ( `id`, `game_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `game`
CHANGE `name` `name` varchar(100) COLLATE 'utf8_general_ci' NOT NULL COMMENT '游戏名字' AFTER `id`,
CHANGE `intro` `intro` varchar(1000) COLLATE 'utf8_general_ci' NOT NULL COMMENT '游戏介绍' AFTER `name`,
CHANGE `img` `img` varchar(1000) COLLATE 'utf8_general_ci' NOT NULL COMMENT '游戏icon 地址' AFTER `intro`,
CHANGE `game_id` `game_id` int(11) NOT NULL COMMENT '游戏id' AFTER `img`;

