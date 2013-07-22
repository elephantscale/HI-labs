Lab : Hive Customer Billing
project dir : hive/billing


== STEP 1) 
Lets create an external table for our billing data
inspect file scripts/create_table_billing_data_ext.q
fix the TODO items


== STEP 2) use Hive to create the table
    $ hive -f scripts/create_table_billing_data_ext.q
or
    $ ~/hive_shell.sh -f scripts/create_table_billing_data_ext.q


== STEP 3) launch Hive shell, and inspect the table just created
    $ hive
    hive > show tables;

    hive > describe <your_name>_billing_data;


== STEP 4) lets count the number of rows in the table
Launch hive shell
    $ hive

    hive >  select count(1) from <your name>_billing_data;

This will actually kick off a mapreduce job, and at the end you will get the count


== STEP 5) see a sample of data
Lanch hive shell
    $ hive

    hive > select * from <your_name>_billing_data  limit 10;
output might look like:
    OK
    1325376000000   614156  6   77  89
    1325376000864   471440  10  25  0
    1325376001728   377292  3   63  83

another query:
    hive > select * from <your name>_billing_data where customer_id = 61442 limit 5;


== STEP 6) calculate customer totals
launch hive shell
    $ hive
    hive > select customer_id, SUM(cost) as total from <your name>_billing_data group by customer_id limit 5;


== STEP 7) find top spending customers
the query will look like:
    select customer_id, SUM(cost) as total from <yourname>_billing_data group by customer_id order by total desc limit 5;

You can execute this query directly from hive shell, or place this in a file (e.g top.q) and execute it using hive
    $ hive -f top.q

Question : how many mapreduce jobs are being kicked off?  Why?
