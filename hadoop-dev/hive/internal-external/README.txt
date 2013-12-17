Lab : Internal vs external tables

STEP 1) inspect file scripts/create_table_billing_data_ext.q
replace <your name> with your username

STEP 2) use Hive to create the table
    $ hive -f create_table_billing_data_ext.q
    $ ~/hive_shell.sh -f create_table_billing_data_ext.q

STEP 3) launch Hive shell, and inspect the table just created
    $ hive
    hive > show tables;

    hive > describe <your_name>_billing_data;


STEP 4) lets count the number of rows in the table
Launch hive shell
    $ hive

    hive >  select count(1) from <your name>_billing_data;

This will actually kick off a mapreduce job, and at the end you will get the count

STEP 5) now delete the external table, verify that the actual data is still in HDFS
Confirm that the table is not seen by Hive
Restore external table definition, verify that the table is seen by Hive and that
the data is again intact inside the table

STEP 6) experiment with internal tables
Create the table, load it. Where did the HDFS data go to?
Do table queries, then delete the table
Verify that the table is not seen by Hive and that moreover it is not in HDFS
Re-create the table, verify that it is empty 
