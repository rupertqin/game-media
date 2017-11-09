CREATE TABLE IF NOT EXISTS `game`(
   `id` INT UNSIGNED AUTO_INCREMENT,
   `name` VARCHAR(100) NOT NULL,
   `intro` VARCHAR(1000) NOT NULL,
   `img` VARCHAR(1000) NOT NULL,
   `game_id` INT NOT NULL,
   PRIMARY KEY ( `id`, `game_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;