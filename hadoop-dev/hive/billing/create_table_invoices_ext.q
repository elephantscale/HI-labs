-- TODO 1 : replace '<your name>' with your username
-- TODO 2 : replace '<login name>' with actual login name (e.g ubuntu or ec2-user)

CREATE EXTERNAL TABLE <your name>_invoices (
    customer_id INT,
    total INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/<login name>/<your name>/billing/invoices'  ;
