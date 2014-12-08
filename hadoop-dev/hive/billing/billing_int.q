-- TODO 1  replace 'MY_NAME' with your username
CREATE TABLE MY_NAME_billing (
    ts BIGINT,
    customer_id INT,
    resource_id INT,
    qty INT,
    cost INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';
