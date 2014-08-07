-- TODO 1 : replace '<your name>' with your username
-- TODO 2 : replace '<login name>' with login name (e.g ubuntu or ec2-user)

CREATE EXTERNAL TABLE <your name>_billing_p (
    ts BIGINT,
    customer_id INT,
    resource_id INT,
    qty INT,
    cost INT)
PARTITIONED BY (dt STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/<login name>/<your name>/billing/hivep'
