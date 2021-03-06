CREATE TABLE `planets` (
`id` int primary key AUTO_INCREMENT,
`name` varchar(30) not null
);

CREATE TABLE `spaceports` (
`id` int PRIMARY key AUTO_INCREMENT,
`name` varchar(50) not null,
`planet_id` int,
CONSTRAINT fk_spaceports_planets
FOREIGN KEY(`planet_id`)
REFERENCES `planets`(`id`)
);

CREATE TABLE `spaceships` (
`id` int PRIMARY key AUTO_INCREMENT,
`name` varchar(50) not null,
`manufacturer` varchar(30) not null,
`light_speed_rate` int default(0)
);

CREATE TABLE `colonists` (
`id` int primary key AUTO_INCREMENT,
`first_name` varchar(20) not null,
`last_name` varchar(20) not null,
`ucn` char(10) not null unique,
`birth_date` DATE not null
);

CREATE TABLE `journeys` (
`id` int primary key AUTO_INCREMENT,
`journey_start` DATETIME not null,
`journey_end` DATETIME not null,
`purpose` enum('Medical', 'Technical',
	'Educational', 'Military'),
`destination_spaceport_id` int,
`spaceship_id` int,
CONSTRAINT fk_journeys_spaceports
FOREIGN KEY(`destination_spaceport_id`)
REFERENCES `spaceports`(`id`),
CONSTRAINT fk_journeys_spaceships
FOREIGN KEY(`spaceship_id`)
REFERENCES `spaceships`(`id`)
);

CREATE TABLE `travel_cards` (
`id` int PRIMARY key AUTO_INCREMENT,
`card_number` char(10) not null unique,
`job_during_journey` enum('Pilot', 'Engineer', 
	'Trooper', 'Cleaner', 'Cook'),
`colonist_id` int,
`journey_id` int,
CONSTRAINT fk_travel_cards_colonists
FOREIGN KEY(`colonist_id`)
REFERENCES `colonists`(`id`),
CONSTRAINT fk_travel_cards_journeys
FOREIGN KEY(`journey_id`)
REFERENCES `journeys`(`id`)
);
