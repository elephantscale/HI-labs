ETL Lab
-------
(Instructor will provide the answers after the lab
Instructor: answer in   hadoop-training/answers/etl-answer.txt)

Objective : Process billing records and customer records
    - Customer records are in database (db : training,  table : customers).  Use Sqoop to import the data into HDFS

    - Billing data is in HDFS  (We can assume this data comes via Flume)

    - Cleanup billing data (using Pig)

    - combine two datasets and generate reports  (use Pig and Hive)

    - export results back into db (use Sqoop)


We will use HDFS directory '<your name>/etl'  as the top level directory.

== STEP 1)  Customer Data
Verify data in mysql
    $  mysql -u root training
    >  select * from customers LIMIT 10;
    >  exit;

Use sqoop to export customer data from mysql database into HDFS
TODO : fix <your name>
Command we want is 'sqoop import'
Refer to sqoop's online manual for syntax
Here are some parameters to get you started.
    $  sqoop import
            --connect jdbc:mysql://HOST_NAME/training
            --username ____
            --password ____
            --table ____
            --target-dir  _____

Instructor will provide details for host / user / password.

Verify that the customer data is in HDFS  (via NameNode webui)


== STEP 2)  Billing Data
Typically billing data will be coming into HDFS via flume.
We will simulate this in this case.  Let's generate some billing data and dump into HDFS dir : <your name>/etl/raw

Hint 1 : sample billing here : ../../data/billing-data/sample.txt
Hint 2 :  use the python script to generate data
    $  python  ../../data/billing-data/gen-billing-data.py
copy generated billing data into HDFS dir (raw)


== STEP 3) Clean up billing data
Use Pig to cleanup billing data
Let's remove all billing records that have cost == 0
Edit cleanup.pig
And execute it
    $  pig cleanup.pig

Extra :  Also save records with cost == 0 into a separate directory
(so some one can analyze this later and debug)


== STEP 4) Create Hive tables for billing & customer data
Create hive tables
Edit file : create_hive_tables.q
Fix TODO items.
    $ hive -f  create_hive_tables.q


== STEP 5)  Generate invoices.
Now that we have prepared the data, we are going to use Hive to run some
reports.
Fire up hive shell and verify data
    $  hive
    >  select * from <your name>_etl_billing   LIMIT 10;
    >  select * from <your name>_etl_customers   LIMIT 10;

Write query to generate invoice data:
    > SELECT ________________  LIMIT 10;

Now save all invoices into <your name>_invoices table
    > INSERT OVERWRITE TABLE ________;


Verify invoice data:
    >  select * from <your name>_etl_invoices   LIMIT 10;


== STEP 7)
We are going to export the invoice data to mysql

Let's create a db table in mysql database to hold invoice data.
Edit file : create_db_table.sql
Fix TODOs.
Run the file
    $   mysql -u root  training < create_db_table.sql

Verify that the db table is there by the following command:
TODO : fix <your name>
    $   mysql -u root training -e 'describe <your name>_invoices'

Now lets use Sqoop to export data from HDFS --> mysql
Use the following command.
TODO : fix <your name>
    $ sqoop export
        --connect jdbc:mysql://HOST_NAME/training
        --username _____
        --password _____
        --table _____
        --export-dir _______
        --input-fields-terminated-by ','


Verify invoice data in mysql:
    $ mysql -u root  training
    > select * from invoices LIMIT 10;
    >  exit;


== BONUS LAB : apply discounts
'customers' data has a discount column.  Apply discount to total customer invoice.
Hint : Modify hive query for invoicing and re-export results using sqoop


== BONUS LAB : Calculate state-wide revenue
    (Hint : customers data has state)

=== BONUS LAB : Use Hive partitions
So far, we have been using 'all' of billing data.
In this lab, we are going to partition the billing data by MONTH
    month=2012-01
    month=2012-02
    ...etc

Edit gen-billing-data.py to generate more data
    $  vi   ../../data/billing-data/gen-billing-data.py
change 'days=10'  to 'days=45'
save and run the script
    $  python  ../../data/billing-data/gen-billing-data.py

Now create a Hive table to contain these 'raw' billing data, partition it by month
    create table....(
    ) PARTITIONED BY (month string)

Load the generated billing data into Hive partitions
Hint:
    hive>  LOAD .... "2012-01-*.log"  ...  INTO table ...  (partition month="2012-01")
