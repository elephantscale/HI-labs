-- loads sample data into mysql

-- customer data
truncate customers;
LOAD DATA LOCAL INFILE 'customers.log' INTO TABLE customers FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (id, name, email, state, discount);

-- billing data
-- truncate billing;
-- LOAD DATA LOCAL INFILE 'billing-2012-01-01.log' INTO TABLE billing FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (timestamp, customer_id, resource_id, qty, cost);

