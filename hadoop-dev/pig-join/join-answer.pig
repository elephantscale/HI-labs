-- pig-billing.pig

-- ## TODO : set the name of job
SET job.name 'my_job';


-- Parse Input File
billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long,custid:chararray,resource_id:chararray,qty:int,cost:int);
DUMP billing_data;

resource_data = LOAD '<your name>/billing/resources.txt' USING PigStorage('=') AS (resource_id2:int, resource_name:chararray);
DUMP resource_data;

joined = JOIN billing_data by resource_id,  resource_data  by resource_id2;
DESCRIBE joined;
DUMP joined;


outer_join = JOIN billing_data by resource_id LEFT OUTER, resource_data  by resource_id2;
DESCRIBE outer_join;
DUMP outer_join;
