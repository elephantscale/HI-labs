-- TODO 1 : replace 'MY_NAME' with your username
-- TODO 2 : replace 'LOGIN_NAME' with actual login name (e.g ubuntu or ec2-user)

CREATE EXTERNAL TABLE MY_NAME_invoices (
    customer_id INT,
    total INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
stored as textfile
LOCATION '/user/LOGIN_NAME/MY_NAME/billing/invoices'  ;
