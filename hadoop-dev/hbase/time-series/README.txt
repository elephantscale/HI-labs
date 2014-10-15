Lab : Storing time-series data in HBase
----
In this lab, we are going to store sensor data and query it.

project dir : HI-labs/hadoop-dev/hbase/time-series
you can also open the project in eclipse
To compile the project:
    $  ../compile.sh
        or
    $  mvn clean package


== STEP 1) create a sensors table on hbase
invoke hbase shell.
create a '<your name>_sensors' table.  Replace <your name> with your username.
This table will have only ONE column family : 'd'
HINT : help 'create'


== STEP 2) Inserting Data
follow : insert.txt


== STEP 3) Querying Data
follow : query.txt
