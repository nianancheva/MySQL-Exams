CREATE TABLE `players` (
`id` INT PRIMARY Key AUTO_INCREMENT,
`first_name` VARCHAR(10) NOT NULL,
`last_name` VARCHAR(20) not NULL,
`age` INT(11) not null DEFAULT 0,
`position` CHAR(1) not null, 
`salary` decimal(10, 2) not null default 0,
`hire_date` DATETIME,
`skills_data_id` int(11) not null,
`team_id` int(11)
);

CREATE table `players_coaches` (
`player_id` int(11),
`coach_id` int(11)
);

CREATE table `coaches` (
`id` int(11) primary key AUTO_INCREMENT,
`first_name` varchar(10) not null,
`last_name` varchar(20) not null,
`salary` decimal(10, 2) not null default 0,
`coach_level` int(11) not null default 0
);

CREATE table `skills_data` (
`id` int(11) PRIMARY KEY AUTO_INCREMENT,
`dribbling` int(11) default 0,
`pace` int(11) default 0,
`passing` int(11) default 0,
`shooting` int(11) default 0,
`speed` int(11) default 0,
`strength`  int(11) default 0
);

CREATE table `teams` (
`id` int(11) primary key AUTO_INCREMENT,
`name` varchar(45) not null,
`established` DATE not null,
`fan_base` BIGINT(20) not null DEFAULT 0,
`stadium_id` int(11) not null
);

CREATE TABLE `stadiums` (
`id` int(11) primary key AUTO_INCREMENT,
`name` varchar(45) not null,
`capacity` int(11) not null,
`town_id` int(11) not null
);

CREATE table `towns` (
`id` int(11) primary key AUTO_INCREMENT,
`name` varchar(45) not null,
`country_id` int(11) not null
);

create table `countries` (
`id` int(11) PRIMARY key AUTO_INCREMENT,
`name` VARCHAR(45) not null
);

--

ALTER TABLE `players`
add CONSTRAINT fk_players_skills_data
FOREIGN KEY(`skills_data_id`)
REFERENCES `skills_data`(`id`);

ALTER TABLE `players`
add CONSTRAINT fk_players_teams
FOREIGN KEY(`team_id`)
REFERENCES `teams`(`id`);

ALTER TABLE `players_coaches`
add CONSTRAINT fk_players_coaches_players
FOREIGN KEY(`player_id`)
REFERENCES `players`(`id`),
ADD CONSTRAINT fk_players_coaches_coaches
FOREIGN KEY(`coach_id`)
REFERENCES `coaches`(`id`);

ALTER TABLE `teams`
add CONSTRAINT fk_teams_stadiums
FOREIGN KEY(`stadium_id`)
REFERENCES `stadiums`(`id`);

ALTER TABLE `stadiums`
add CONSTRAINT fk_stadiums_towns
FOREIGN KEY(`town_id`)
REFERENCES `towns`(`id`);

ALTER TABLE `towns`
add CONSTRAINT fk_towns_countries
FOREIGN KEY(`country_id`)
REFERENCES `countries`(`id`);
