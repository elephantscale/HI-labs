-- TODO 1 : replace '<your name>' with your username
-- TODO 2 : replace '<login name>' with actual login name

CREATE EXTERNAL TABLE <your name>_billing_data (ts BIGINT, customer_id INT, resource_id INT, qty INT, cost INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/<login name>/<your name>/billing/in'  ;
