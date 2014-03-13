DROP TABLE IF EXISTS `billing` ;
CREATE TABLE  `billing` (
    `id` INT NOT NULL AUTO_INCREMENT ,
    `timestamp` BIGINT NOT NULL ,
    `customer_id` INT NOT NULL ,
    `resource_id` INT NOT NULL ,
    `qty` INT NOT NULL ,
    `cost` INT NOT NULL ,
    PRIMARY KEY (  `id` )
) ENGINE = MYISAM ;

DROP TABLE IF EXISTS `customers`;
CREATE TABLE  `customers` (
    `id` INT NOT NULL ,
    `name` varchar(50) NOT NULL ,
    `email` varchar(50) NOT NULL ,
    `state` varchar(5) NOT NULL ,
    `discount` INT NULL ,
    PRIMARY KEY (  `id` )
) ENGINE = MYISAM ;

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE  `invoices` (
    `customer_id` INT NOT NULL ,
    `total` INT NOT NULL ,
    PRIMARY KEY (  `customer_id` )
) ENGINE = MYISAM ;
