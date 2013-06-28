-- replace '<your name>' with your username
CREATE EXTERNAL TABLE <your name>_billing_data (ts BIGINT, customer_id INT, resource_id INT, qty INT, cost INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/um/<your name>/billing/in'  ;
