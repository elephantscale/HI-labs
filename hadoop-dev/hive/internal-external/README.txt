Lab : Hive Internal vs external tables
working dir :   HI-labs/hadoop-dev/hive/internal-external

=== STEP 1)  create an external table
Edit the file : ext.q
Fix TODOs
Execute the script
    $  hive -f  ext.q


=== STEP 2) Verify table and data in hive
Launch Hive shell
    $   hive
    >   show tables;
    >   select * from <your name>_ext;
    >   quit;
No data, right?


=== STEP 3) Copy data into Hive table
TODO : replace <your name>
    $   hdfs dfs -put ../../../data/billing-data/sample.txt    <your name>/billing/hive/

Now launch Hive and see if there is any data in table
    $   hive
    >   select * from <your name>_billing_ext;
Do you see data?
How many rows?

Try this:
Copy the same sample file sample.txt  as  sample2.txt into Hive
    $   hdfs dfs -put ../../../data/billing-data/sample.txt    <your name>/billing/hive/sample2.txt

Now launch Hive and see if there is any data in table
    $   hive
    >   select * from <your name>_ext;
Do you see data?
How many rows?
Hive will pick up all files in the directory.



=== STEP 4) Creating internal table
Edit the file : int.q
Fix TODOs
Execute the script
    $  hive -f  int.q


=== STEP 5) Verify table and data in hive
Launch Hive shell
    $   hive
    hive>   show tables;
    hive>   select * from <your name>_int;
    hive>   quit;
No data, right?


=== STEP 6)  Stage some billing data in HDFS
    $   hdfs  dfs -mkdir   <your name>/billing/stage
    $   hdfs dfs -put ../../../data/billing-data/sample.txt    <your name>/billing/stage/


=== STEP 7)   Load data into Hive table
Start hive shell and run the load command
TODO : fix <your name>
    $   hive
    hive>   LOAD DATA INPATH '<your name>/billing/stage' INTO TABLE <your name>_int;

if the load is successful, query the internal table

    hive>   select * from <your name>_int;
see data?

=== STEP 8)  Verifying internal table location in HDFS
Using HDFS file browser, find out where the internal table <your_name>_int  lives
Hint : Look into  /user/hive (or /apps/hive)  directory


=== STEP 9)  dropping tables
In Hive shell drop the tables you just created
    $  hive
    hive>   drop table <your name>_ext;
    hive>   drop table <your name>_int;
    hive>   show tables;


=== STEP 10)  Verify what happened to the data HDFS
Browse HDFS directories
    - for internal table :   /user/hive  or /apps/hive
    - external table :   /user/<login name>/<your name>/billing/hive

which data deleted?  which data is preserved?



=== BONUS LAB 1)  distinguising internal / external table
how can we find out if a table is internal or external?
Hint : refer to Hive manual for 'describe'
    https://cwiki.apache.org/confluence/display/Hive/LanguageManual
        or
    https://github.com/elephantscale/HI-labs/tree/master/hadoop-dev/hive/billing/Hortonworks-CheatSheet-SqlHive.pdf
