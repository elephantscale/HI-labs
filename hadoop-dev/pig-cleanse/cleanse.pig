-- data cleansing lab

-- ## TODO : set the name of job
SET job.name 'my_job';

## TODO : fix input dir
billing_data = LOAD '<your name>/billing/in2/bad_records.txt' USING PigStorage(',') AS (timestamp,custid,resourceid,qty,cost);
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
-- STORE C into '<your name>/billing/bad_data/' ;
