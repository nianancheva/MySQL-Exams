create table `pictures` (
`id` int PRIMARY key AUTO_INCREMENT,
`url` varchar(100) not null,
`added_on` DATETIME not null
);

create table `categories` (
`id` int primary key AUTO_INCREMENT,
`name` varchar(40) not null UNIQUE
);

create table `products` (
`id` int primary key AUTO_INCREMENT,
`name` varchar(40) not null unique,
`best_before` DATE,
`price` decimal(10, 2) not null,
`description` text,
`category_id` int not null,
`picture_id` int not null,
CONSTRAINT fk_products_categories
FOREIGN KEY (`category_id`) 
references `categories`(`id`),
CONSTRAINT fk_products_pictures
FOREIGN KEY (`picture_id`) 
references `pictures`(`id`)
);

create table `towns` (
`id` int primary key AUTO_INCREMENT,
`name` varchar(20) not null UNIQUE
);

create table `addresses` (
`id` int primary key AUTO_INCREMENT,
`name` varchar(50) not null unique,
`town_id` int not null,
CONSTRAINT fk_addresses_towns
FOREIGN KEY (`town_id`) 
references `towns`(`id`)
);

create table `stores` (
`id` int primary key AUTO_INCREMENT,
`name` varchar(20) not null unique,
`rating` FLOAT not null,
`has_parking` BOOLEAN DEFAULT FALSE,
`address_id`int not null,
CONSTRAINT fk_stores_addresses
FOREIGN KEY (`address_id`) 
references `addresses`(`id`)
);

create table `products_stores` (
`product_id` int not null,
`store_id` int not null,
CONSTRAINT fk_ps_products
FOREIGN KEY (`product_id`) 
references `products`(`id`),
CONSTRAINT fk_ps_stores
FOREIGN KEY (`store_id`) 
references `stores`(`id`),
PRIMARY KEY(`product_id`, `store_id`)
);

create table `employees` (
`id` int primary key AUTO_INCREMENT,
`first_name` varchar(15) not null,
`middle_name` char(1),
`last_name` varchar(20) not null,
`salary` decimal(19, 2) not null default(0),
`hire_date` DATE not null,
`manager_id` int,
`store_id` int not null,
CONSTRAINT fk_employees_managers
FOREIGN KEY (`manager_id`) 
references `employees`(`id`),
CONSTRAINT fk_employees_stores
FOREIGN KEY (`store_id`) 
references `stores`(`id`)
);
