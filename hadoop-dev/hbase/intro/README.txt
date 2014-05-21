HBase Intro:
----


== STEP 1) View HBASE Web Interface
Hbase master dashboard can be accessed via a browser:
(instructor will provide details)

Q : What is the version of  HBase?
Q : What tables do you see?  Note about system tables and user tables
Q : how many region servers do you see in the cluster?


== STEP 2) using 'hbase' command
On terminal invoke 'hbase'
    $ hbase
    Usage: hbase <command>

Q : Find out the version of hbase using CLI


== STEP 3) Hbase Shell
Invoke hbase shell in a terminal
    $ hbase shell
You should a prompt like:
    hbase(main):001:0>

Try the 'help' command
    hbase> help

To find help for a specific command use
    help 'create'
(don't forget the quotes)

== STEP 4) See all tables
HINT : use 'list' command


== STEP 5) Find out the 'status' of the cluster:
Hint : status command
Q : Can you get 'detailed' status ?
Hint : help "status"   (don't forget the quotes)



== STEP 6) creating TABLE using hbase shell
we are going to create a table named '<your name>_test' with one family named 'd'
Replace <your_name> with your name :)
    hbase> create '<your name>_test', 'd'
e.g  :     create 'sujee_test', 'd'
    0 row(s) in 1.1120 seconds

Use the list command to verify the table exists
    hbase> list
    TABLE
    sujee_test


== STEP 7) Find out more about the table
Hint : 'describe'
Inspect the output produced by HBase


== STEP 8) insert some rows into <your name>_test table
put command works like this:
    put <table name>  <row key>   <column_famly : column>    <value>

    hbase>  put '<your name>_test', 'r1', 'd:c1', 'foo'
    hbase>  put '<your name>_test', 'r1', 'd:c2', 'bar'
    hbase>  put '<your name>_test', 'r2', 'd:c1', 'baz'


== STEP 9) inspect a row
use 'get'


== STEP 10) find out the contents of the table
Hint : use 'scan'
Inspect the output
output may look similar to:
    ROW                           COLUMN+CELL
     r1                           column=d:c1, timestamp=1365320206055, value=foo
     r1                           column=d:c2, timestamp=1365320238460, value=bar
     r2                           column=d:c1, timestamp=1365320505407, value=baz
     2 row(s) in 0.0420 seconds

Note the timestamps, Hbase inserts timestamps automatically (we can over-ride this)

Try this: Scan takes arguments like VERSIONS, LIMIT ...
Try the limit option


== STEP 11)  Over-ride a value
    $   hbase  shell
    hbase>  put '<your name>_test', 'r1', 'd:c1', 'foonew'

scan the table.  What value do see for  r1:d:c1 ?

Q : can you see the old value of r1:d:c1?
Hint : help 'scan'  (look at VERSIONS option)


== STEP 12) count number of rows in a table
Hint : 'count'


== STEP 13) delete a (any) cell value of row 'r1'
Hint : help 'delete'
    delete <table> , <row>,  <family> , <column>
do a 'scan' after the delete


== STEP 14) Examining HBase files in HDFS
HBase stores data in HDFS
Either open HDFS Web UI or  Hue Web UI
navigate to directory : /hbase
explore the directory structure.
Q : how are the tables stored?

Navigate to your table directory
Q : Do you see more directories under there?  What do they represent?

Navigate further into the dir structure
Do you see the actual file where data is stored?
If not, your table hasn't be saved to disk yet (not flushed)
Go to HBase shell and flush your table
HINT : flush 'table_name'

Now inspect  HDFS storage directory, do you see the data file?


== STEP 15)  delete the entire table you just created
Hint : drop


== BONUS Lab)
    Create another table with two column families 'f1'  and 'f2'
    f1 has 1 VERSIONs
    f2 has 2 VERSIONs
Hint : help 'create'
