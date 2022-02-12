CREATE TABLE `addresses` (
`id` int PRIMARY key AUTO_INCREMENT,
`name` varchar(50) not null
);

CREATE TABLE `categories` (
`id` int PRIMARY key AUTO_INCREMENT,
`name` varchar(10) not null
);

CREATE TABLE `offices` (
`id` int primary key AUTO_INCREMENT,
`workspace_capacity` int not null,
`website` varchar(50),
`address_id` int not null,
CONSTRAINT fk_offices_addresses
FOREIGN KEY(`address_id`)
REFERENCES `addresses`(`id`)
);

CREATE TABLE `employees` (
`id` int primary key AUTO_INCREMENT,
`first_name` varchar(30) not null,
`last_name` varchar(30) not null,
`age` int not null,
`salary` decimal(10, 2) not null,
`job_title` varchar(20) not null,
`happiness_level` char(1) not null
);

CREATE TABLE `teams` (
`id` int primary key AUTO_INCREMENT,
`name` varchar(40) not null,
`office_id` int not null,
`leader_id` int not null unique,
CONSTRAINT fk_teams_offices
FOREIGN KEY(`office_id`)
REFERENCES `offices`(`id`),
CONSTRAINT fk_teams_employees
FOREIGN KEY(`leader_id`)
REFERENCES `employees`(`id`)
);

CREATE TABLE `games` (
`id` int primary key AUTO_INCREMENT,
`name` varchar(50) not null unique,
`description` text,
`rating` FLOAT not null default(5.5),
`budget` DECIMAL(10, 2) not null,
`release_date` date,
`team_id` int not null,
CONSTRAINT fk_games_teams
FOREIGN KEY(`team_id`)
REFERENCES `teams`(`id`)
);

CREATE TABLE `games_categories` (
`game_id` int not null,
`category_id` int not null,
CONSTRAINT pk_games_categories
PRIMARY KEY(`game_id`, `category_id`),
CONSTRAINT fk_gc_games
FOREIGN KEY(`game_id`)
REFERENCES `games`(`id`),
CONSTRAINT fk_gc_categories
FOREIGN KEY(`category_id`)
REFERENCES `categories`(`id`)
);
