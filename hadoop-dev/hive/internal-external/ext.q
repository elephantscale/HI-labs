-- TODO :  replace '<your name>' with your name
-- TODO :  replace '<login name>' with login name (e.g  ubuntu ,  ec2-user)

CREATE EXTERNAL TABLE <your name>_ext (
    ts BIGINT,
    customer_id INT,
    resource_id INT,
    qty INT,
    cost INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/<login name>/<your name>/billing/hive'  ;
