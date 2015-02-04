-- TODO 1 : replace 'MY_NAME' with MY_NAME username
-- TODO 2 : replace 'LOGIN_NAME' with login name (e.g ubuntu or ec2-user)

CREATE EXTERNAL TABLE MY_NAME name>_billing_p (
    ts BIGINT,
    customer_id INT,
    resource_id INT,
    qty INT,
    cost INT)
PARTITIONED BY (dt STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/LOGIN_NAME/MY_NAME/billing/hivep'
