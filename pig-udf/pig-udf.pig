-- # UDF example

register 'myudf.jar';

records = LOAD '/adlogs/in/a.log' using PigStorage(',') AS (ts:long, server:int, user:int, action:int, domain:chararray, price:int);
DUMP records;

-- # we are going to 'massage' the domain name in our UDF
A = FOREACH records GENERATE myudf.ShortDomainName(domain), price;
DUMP A;


