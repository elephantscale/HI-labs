-- TODO 1 : replace '<your name>' with your username
-- TODO 2 : replace '<login name>' with actual login name

-- # joined table
CREATE EXTERNAL TABLE <your name>_customer_billing (ts BIGINT, custid INT, resource_id INT, qty INT, cost INT, custid2 INT, custname STRING, email STRING, state STRING, discount INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
stored as textfile
LOCATION '/user/<login name>/<your name>/billing/joined'  ;

-- # invoice table
CREATE EXTERNAL TABLE <your name>_invoices (custid INT,  total INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
stored as textfile
LOCATION '/user/<login name>/<your name>/billing/invoices'  ;
