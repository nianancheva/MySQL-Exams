CREATE TABLE `users` (
`id` int PRIMARY key,
`username` varchar(30) not null UNIQUE,
`password` varchar(30) not null,
`email` varchar(50) not null,
`gender` char(1) not null,
`age` int not null,
`job_title` varchar(40) not null,
`ip` varchar(30) not null
);

CREATE TABLE `addresses` (
`id` int PRIMARY key AUTO_INCREMENT,
`address` varchar(30) not null,
`town` varchar(30) not null,
`country` varchar(30) not null,
`user_id` int not null,
CONSTRAINT fk_addresses_users
FOREIGN KEY(`user_id`)
REFERENCES `users`(`id`)
);

CREATE table `photos` (
`id` int PRIMARY key AUTO_INCREMENT,
`description` TEXT not null,
`date` DATETIME not null,
`views` int not null DEFAULT(0)
);

create table `comments` (
`id` int PRIMARY key AUTO_INCREMENT,
`comment` VARCHAR(255) not null,
`date` DATETIME not null,
`photo_id` int not null,
CONSTRAINT fk_comments_photos
FOREIGN KEY(`photo_id`)
REFERENCES `photos`(`id`)
);

create table `users_photos` (
`user_id` int not null,
`photo_id` int not null,
CONSTRAINT fk_up_users
FOREIGN KEY(`user_id`)
REFERENCES `users`(`id`),
CONSTRAINT fk_up_photos
FOREIGN KEY(`photo_id`)
REFERENCES `photos`(`id`)
);

create table `likes` (
`id` int PRIMARY key AUTO_INCREMENT,
`photo_id` int,
`user_id` int,
CONSTRAINT fk_likes_photos
FOREIGN KEY(`photo_id`)
REFERENCES `photos`(`id`),
CONSTRAINT fk_likes_users
FOREIGN KEY(`user_id`)
REFERENCES `users`(`id`)
);

