-- TODO :  replace 'MY_NAME' with your name
-- TODO :  replace '<login name>' with login name (e.g  ubuntu ,  ec2-user)

CREATE EXTERNAL TABLE MY_NAME_ext (
    ts BIGINT,
    customer_id INT,
    resource_id INT,
    qty INT,
    cost INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/LOGIN_NAME/MY_NAME/billing/hive'  ;
