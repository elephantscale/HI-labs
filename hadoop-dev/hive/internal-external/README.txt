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
    >   select * from MY_NAME_ext;
    >   quit;
No data, right?


=== STEP 3) Copy data into Hive table
TODO : replace MY_NAME
    $   hdfs   dfs -mkdir  -p  MY_NAME/billing/hive
    $   hdfs dfs -put ../../../data/billing-data/sample.txt    MY_NAME/billing/hive/

Now launch Hive and see if there is any data in table
    $   hive
    >   select * from MY_NAME_ext;
Do you see data?
How many rows?

Try this:
Copy the same sample file sample.txt  as  sample2.txt into Hive
    $   hdfs dfs -put ../../../data/billing-data/sample.txt    MY_NAME/billing/hive/sample2.txt

Now launch Hive and see if there is any data in table
    $   hive
    >   select * from MY_NAME_ext;
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
    hive>   select * from MY_NAME_int;
    hive>   quit;
No data, right?


=== STEP 6)  Stage some billing data in HDFS
    $   hdfs  dfs -mkdir   MY_NAME/billing/stage
    $   hdfs dfs -put ../../../data/billing-data/sample.txt    MY_NAME/billing/stage/


=== STEP 7)   Load data into Hive table
Start hive shell and run the load command
TODO : fix MY_NAME
    $   hive
    hive>   LOAD DATA INPATH 'MY_NAME/billing/stage' INTO TABLE MY_NAME_int;

if the load is successful, query the internal table

    hive>   select * from MY_NAME_int;
see data?

=== STEP 8)  Verifying internal table location in HDFS
Using HDFS file browser, find out where the internal table MY_NAME_int  lives
Hint : Look into  /user/hive (or /apps/hive)  directory


=== STEP 9)  dropping tables
In Hive shell drop the tables you just created
    $  hive
    hive>   drop table MY_NAME_ext;
    hive>   drop table MY_NAME_int;
    hive>   show tables;


=== STEP 10)  Verify what happened to the data HDFS
Browse HDFS directories
    - for internal table :   /user/hive  or /apps/hive
    - external table :   /user/<login name>/MY_NAME/billing/hive

which data deleted?  which data is preserved?



=== BONUS LAB 1)  distinguising internal / external table
how can we find out if a table is internal or external?
Hint : refer to Hive manual for 'describe'
    https://cwiki.apache.org/confluence/display/Hive/LanguageManual
        or
    https://github.com/elephantscale/HI-labs/tree/master/hadoop-dev/hive/Hortonworks-CheatSheet-SqlHive.pdf
