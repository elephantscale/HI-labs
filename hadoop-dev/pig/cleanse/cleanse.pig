-- data cleansing lab

-- ## TODO : set the name of job
SET job.name 'MY_NAME clean.pig';

## TODO : fix input dir
-- ## TODO : load billing data, change MY_NAME
billing_data = LOAD 'MY_NAME/billing/in2/bad_records.txt' USING PigStorage(',') AS (timestamp,custid,resourceid,qty,cost);
DUMP billing_data;

-- ## TODO : filter out valid resource_id
-- A = FILTER billing_data BY resourceid is not null;
-- DUMP A;

-- ## TODO : now filter records that have all valid fields
-- B = FILTER billing_data BY timestamp is not null AND .....  ;
-- DUMP B;

-- ## TODO  : store the bad records so they can be checked
-- ##         hint, use OR
-- C = FILTER billing_data BY .....
-- STORE C into 'MY_NAME/billing/bad_data/' ;
