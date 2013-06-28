-- replace '<your name>' with your username
-- please note that on a different cluster /user/ubuntu may have to be substituted with another login name
CREATE EXTERNAL TABLE <your name>_billing_data (ts BIGINT, customer_id INT, resource_id INT, qty INT, cost INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/ubuntu/<your name>/billing/in'  ;
