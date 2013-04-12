Lab : Hive
project dir : hive-intro
you can also open the project in eclipse

============================================================
LAB 1: Create and import tables, run queries
============================================================
STEP 1) 
Analyze script scripts/create_table_books.q, adjust it with your username
Execute the following commands
hive -e 'show tables'
hive -f scripts/create_table_books.q
(if the table is already there, do this: hive -e 'drop table books')
hive -e 'describe books'

STEP 2)
Analyze script scripts/load_table_books.q, adjust it with your username
Execute HFDS instructions in this script, then run the script
hive -f scripts/load_table_books.q
hive -e 'select count(*) from books' 
Count the number of characters in the book:
hive -e 'select sum(length(line)) from books'

Extra credit:
Count words in 'books'
Hint: use a UDF
Answer: hi.hive.CountWords.java

============================================================
LAB 2: Customer invoicing
============================================================
STEP 1) 
Analyze script scripts/create_table_resource_log.q, adjust it with your username
Execute the following commands
hive -e 'show tables'
hive -f scripts/create_table_resource_log.q
(if the table is already there, do this: hive -e 'drop table resource_log')
hive -e 'describe resource_log'

STEP 2)
Analyze script scripts/create_table_resource_log.q, adjust it with your username
Execute HFDS instructions in this script, then run the script
hive -f scripts/create_table_resource_log.q
hive -f scripts/load_table_resource_log.q
hive -f scripts/invoices_resources.q
Note the output: for easy verification, 
the input data is created to invoice each customer the same amount 
============================================================
LAB 3: UDF
============================================================
STEP1)
Analyze log data found in data/hive-data/apache-weblog.log
Compile the UDH based on hi.hive.GetBrowser.java
Load this UDF into have and extract browser information from each log line
(This lab does not give specific instructions, but relies on the student to implement the steps)

============================================================
LAB 4: Billing Data
============================================================
This will create a an external table for our billing data

STEP 1) inspect file scripts/create_table_billing_data_ext.q
replace <your name> with your username

STEP 2) use Hive to create the table
    $ hive -f scripts/create_table_billing_data_ext.q
    $ ~/hive_shell.sh -f scripts/create_table_billing_data_ext.q

STEP 3) launch Hive shell, and inspect the table just created
    $ hive
    hive > show tables;

    hive > describe <your_name>_billing_data;


STEP 4) lets count the number of rows in the table
Launch hive shell
    $ hive

    hive >  select count(1) from <your name>_billing_data;

This will actually kick off a mapreduce job, and at the end you will get the count


STEP 5) see a sample of data
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


STEP 6) calculate customer totals
launch hive shell
    $ hive
    hive > select customer_id, SUM(cost) as total from <your name>_billing_data group by customer_id limit 5;

STEP 7) find top spending customers
the query will look like:
    select customer_id, SUM(cost) as total from <yourname>_billing_data group by customer_id order by total desc limit 5;

You can execute this query directly from hive shell, or place this in a file (e.g top.q) and execute it using hive
    $ hive -f top.q

Question : how many mapreduce jobs are being kicked off?  Why?
