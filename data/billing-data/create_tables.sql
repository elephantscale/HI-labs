CREATE TABLE  `billing` (
    `id` INT NOT NULL AUTO_INCREMENT ,
    `timestamp` BIGINT NOT NULL ,
    `customer_id` INT NOT NULL ,
    `resource_id` INT NOT NULL ,
    `qty` INT NOT NULL ,
    `cost` INT NOT NULL ,
    PRIMARY KEY (  `id` )
) ENGINE = MYISAM ;

CREATE TABLE  `customers` (
    `id` INT NOT NULL AUTO_INCREMENT ,
    `customer_id` INT NOT NULL ,
    `name` varchar(50) NOT NULL ,
    `email` varchar(50) NOT NULL ,
    `state` varchar(5) NOT NULL ,
    PRIMARY KEY (  `id` )
) ENGINE = MYISAM ;

CREATE TABLE  `invoices` (
    `id` INT NOT NULL AUTO_INCREMENT ,
    `customer_id` INT NOT NULL ,
    `total` INT NOT NULL ,
    PRIMARY KEY (  `id` )
) ENGINE = MYISAM ;
