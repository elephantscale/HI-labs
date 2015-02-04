-- TODO 1 : replace 'MY_NAME' with your username
-- TODO 2 : replace 'LOGIN_NAME' with actual login name

CREATE EXTERNAL TABLE MY_NAME_customers (
    id INT,
    name STRING,
    email STRING,
    state STRING,
    discount INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/LOGIN_NAME/MY_NAME/billing/customers'  ;
