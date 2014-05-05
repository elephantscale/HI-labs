Introduction
In this lab we will check to ensure that Habse is running on your
system and be able to get famliar with the user interface.


== STEP 1) View HBASE Web Interface
Hbase master dashboard can be accessed via a browser:
    http://hbase_master:60010

Q : What is the version of  HBase?
Q : What tables do you see?  Note about system tables and user tables
Q : how many region servers do you see in the cluster?


== STEP 2) Only if your 'hbase" command does not work - ensuring that the hbase command works
On a terminal invoke hbase command
    $ hbase
    Usage: hbase <command>

You can fix your path in this shell window by using the following command:
$ export PATH=$PATH:/path/to/hbase/location/bin


== STEP 3) Hbase Shell
Invoke hbase shell in a terminal
    $ hbase shell
You should a prompt like:
    hbase(main):001:0>

Try the 'help' command
    hbase> help


== STEP 4) See all tables
HINT : use 'list' command


== STEP 5) Find out the 'status' of the cluster:
Hint : status command
Q : Can you get 'detailed' status ?
Hint : help "status"   (don't forget the quotes)



== STEP 6) creating TABLE using hbase shell
we are going to create a table named '<your name>_test' with one family named 'd'
    hbase> create '<your name>_test', 'd'
e.g  :   create 'sujee_test', 'd'
    0 row(s) in 1.1120 seconds

Use the list command to verify the table exists
    hbase> list
    TABLE
    test


== STEP 7) Find out more about the table
Hint : 'describe'
Inspect the output produced by HBase


== STEP 8) insert some rows into <your name>_test table
put command works like this:
    put <table name>  <row key>   <column_famly : column>    <value>

    hbase>  put '<your name>_test', 'r1', 'd:c1', 'foo'
    hbase>  put '<your name>_test', 'r1', 'd:c2', 'bar'
    hbase>  put '<your name>_test', 'r2', 'd:c1', 'baz'


== STEP 9) find out the contents of the table
Hint : use 'scan'
Inspect the output
output may look similar to:
    ROW                           COLUMN+CELL
     r1                           column=d:c1, timestamp=1365320206055, value=foo
     r1                           column=d:c2, timestamp=1365320238460, value=bar
     r2                           column=d:c1, timestamp=1365320505407, value=baz
     2 row(s) in 0.0420 seconds

Note the timestamps, Hbase inserts timestamps automatically (we can over-ride this)


== STEP 10) count number of rows in a table
Hint : 'count'


== STEP 11) delete a (any) cell value of row 'r1'
Hint : help 'delete'
    delete <table> , <row>,  <family> , <column>
do a 'scan' after the delete


== STEP 12)  delete the entire table you just created
Hint : drop


== BONUS Lab)
    Create another table with two column families 'f1'  and 'f2'
    f1 has 1 VERSIONs
    f2 has 2 VERSIONs
Hint : help 'create'
