CREATE TABLE IF NOT EXISTS `chosen_game`(
   `id` INT UNSIGNED AUTO_INCREMENT,
   `game_id` INT NOT NULL,
   `account_id` INT NOT NULL,
   `created_at` TIMESTAMP(6),
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;