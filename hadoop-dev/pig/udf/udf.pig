-- # UDF example

-- ## TODO : set the name of job
SET job.name 'my_job';


register 'a.jar';

-- # TODO : replace <your name>
billing_data = LOAD '<your name>/billing/in/sample.txt' USING PigStorage(',') AS (timestamp:long, custid:chararray,resourceid:chararray,qty:int,cost:int);
-- DUMP billing_data;

-- we are going to extract the date from timestamp using our UDF
-- ## TODO  : pass the correct field to udf
A = FOREACH billing_data GENERATE hi.udf.FullDateFromMilliSeconds(timestamp) as date:chararray, cost;
-- DUMP A;

grpd_by_date = GROUP A by date;
total_by_date = FOREACH grpd_by_date GENERATE group as date, SUM(A.cost) as total;
sorted = ORDER total_by_date BY total DESC;
DUMP sorted;

-- # TODO : update <your name>
--- STORE sorted into '<your name>/billing/month2';
