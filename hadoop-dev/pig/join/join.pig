-- join.pig

-- ## TODO-1 : set the name of job
SET job.name 'MY_NAME join.pig';


-- ## TODO-2 : load billing data, change MY_NAME
billing_data = LOAD 'MY_NAME/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:int,resource_id:chararray,qty:int,cost:int);
DUMP billing_data;

-- ## TODO-3 :  Make sure you have resources.txt file in the following 
-- HDFS location :   MY_NAME/billing .
-- Follow 'Lab setup' section  in README.md

-- ## TODO-4 : Load resources data.  Update MY_NAME
resource_data = LOAD 'MY_NAME/billing/resources.txt' USING PigStorage('=') AS (resource_id:int, resource_name:chararray);
DUMP resource_data;

-- ## TODO-5 : join by resource_id
-- ## note, some resource_ids don't have any mappings (e.g 7, 8, 9, 10)
joined = JOIN billing_data by ????,  resource_data  by ????;
DESCRIBE joined;
DUMP joined;
-- ## do all records show up?


-- ## TODO-6 : join by resource_id
-- outer_join = JOIN billing_data by ???? LEFT OUTER, resource_data  by ????;
-- DESCRIBE outer_join;
-- DUMP outer_join;
-- ## do all records show up?
-- ## what is the values for 'missing fields'
