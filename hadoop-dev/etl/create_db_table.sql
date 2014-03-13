-- TODO : fix <your name>
DROP TABLE IF EXISTS `<your name>_invoices`;
CREATE TABLE  `invoices` (
    `customer_id` INT NOT NULL ,
    `total` INT NOT NULL ,
    PRIMARY KEY (  `customer_id` )
) ENGINE = MYISAM ;
