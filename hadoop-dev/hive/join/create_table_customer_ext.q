-- TODO 1 : replace '<your name>' with your username
-- TODO 2 : replace '<login name>' with actual login name

CREATE EXTERNAL TABLE <your name>_customer (
    id INT,
    name STRING,
    email STRING,
    state STRING,
    discount INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/<login name>/<your name>/billing/customer'  ;
