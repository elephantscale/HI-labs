ETL Lab
-------

Objective :
Process billing records and customer records
Customer records are in database (db : training,  table : customers)
Billing data is in HDFS.
combine two datasets and generate reports  (use Pig and Hive)
export report data back into db.

== STEP 1)  Customer Data
Verify data in mysql
    $  mysql -u root training
    >  select * from customers LIMIT 10;
    >  exit;

Use sqoop to export customer data from mysql database into HDFS
TODO : fix <your name>

    $  sqoop import --connect jdbc:mysql://localhost/training  --username root --table customers  --target-dir <your name>/billing/customers

Verify that the customer data is in HDFS  (via NameNode webui)


== STEP 2)  Billing Data
Typically billing data will be coming into HDFS via flume.
We will simulate this in this case.  Let's generate some billing data and dump into HDFS
(TODO : fix <your name>)

    $  python  ../../data/billing-data/gen-billing-data.py
    $  hdfs dfs -mkdir  <your name>/billing/raw
    $  hdfs dfs -put billing*.log   <your name>/billing/raw/
    $  hdfs dfs -put ../../data/billing-data/sample.txt  <your name>/billing/raw/


== STEP 3) Clean up billing data
Let's do some cleanup of billing data.
Remove all billing records that have cost == 0
Save this data in another dir
Edit cleanup.pig
And execute it
    $  pig cleanup.pig


== STEP 4)
Create a join dataset with billing and customer
Edit file 'join.pig'
Run the script
    $  pig  join.pig


== STEP 5)
Now that we have prepared the data, we are going to use Hive to run some
reports

Create hive tables
Edit file : create_hive_tables.q
    $ hive -f  create_hive_tables.q


== STEP 6)
Fire up hive shell and verify data
    $  hive
    >  select * from <your name>_customer_billing   LIMIT 10;

Write query to generate invoice data:
    > SELECT ________________  LIMIT 10;

Now save all invoices into <your name>_invoices table
    > INSERT OVERWRITE TABLE ________;


Verify invoice data:
    >  select * from <your name>_invoices   LIMIT 10;


== STEP 7)
We are going to export the invoice data to mysql

Let's create a db table in mysql database to hold invoice data.
Edit file : create_db_table.sql
Run the file
    $   mysql -u root  training < create_db_table.sql

Verify that the db table is there by the following command:

    TODO : fix <your name>
    $   mysql -u root training -e 'describe <your name>_invoices'

Now lets use Sqoop to export data from HDFS --> mysql
Use the following command.
TODO : fix <your name>
    $ sqoop export --connect jdbc:mysql://localhost/training  --username root
--table invoices   --export-dir <your name>/billing/invoices --input-fields-terminated-by '\t'


Verify invoice data in mysql:
    $ mysql -u root  training
    > select * from invoices LIMIT 10;
    >  exit;


== BONUS LAB
'customers' data has a discount column.  Apply discount to total customer invoice.

== BONUS LAB
    Calculate state-wide revenue
    (Hint : customers data has state)
