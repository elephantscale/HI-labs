-- TODO 1 : replace '<your name>' with your username
-- TODO 2 : replace '<login name>' with actual login name

-- Billing table
CREATE EXTERNAL TABLE <your name>_etl_billing (
    ts BIGINT,
    customer_id INT,
    resource_id INT,
    qty INT,
    cost INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
stored as textfile
LOCATION '/user/<login name>/<your name>/etl/cleaned'  ;


-- Customer Table
CREATE EXTERNAL TABLE <your name>_etl_customers (
    id INT,
    name STRING,
    email STRING,
    state STRING,
    discount INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/<login name>/<your name>/etl/customers'  ;


-- # invoice table
CREATE EXTERNAL TABLE <your name>_etl_invoices (
    customer_id INT,
    total INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/<login name>/<your name>/etl/invoices'  ;
