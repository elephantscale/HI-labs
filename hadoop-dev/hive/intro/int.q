-- TODO : replace 'MY_NAME' appropriately.


CREATE TABLE MY_NAME_int (
    ts BIGINT,
    customer_id INT,
    resource_id INT,
    qty INT,
    cost INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';
