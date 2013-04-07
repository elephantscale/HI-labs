Introduction
In this lab we will check to ensure that Habse is running on your
system and be able to get famliar with the user interface.


STEP 1) View HBASE Web Interface
Hbase master dashboard can be accessed via a browser:
    http://hbase_master:60010

Q : What is the version of  HBase?
Q : What tables do you see?  Note about system tables and user tables
Q : how many region servers do you see in the cluster?




STEP 2) Ensuring that the hbase command works
On a terminal invoke hbase command
    $ hbase
    Usage: hbase <command>

You can fix your path in this shell window by using the following command:
$ export PATH=$PATH:/path/to/hbase/location/bin


STEP 3) Hbase Shell
Invoke hbase shell in a terminal
    $ hbase shell
You should a prompt like:
    hbase(main):001:0>


STEP 4) use 'list' command to see the tables
issue 'list' command in hbase shell
    hbase(main):001:0>  list
you will see any tables if there is any


STEP 5) use 'status' shell command
issue 'status' command to see hbase cluster status
    hbase(main):002:0> status

you might see output like:
1 servers, 0 dead, 2.0000 average load

try detailed status  command
    hbase(main):002:0> status 'detailed'


STEP 6) creating TABLE using hbase shell
we are going to create a table named 'test' with one family named 'd'
    hbase(main):006:0> create 'test', 'd'
    0 row(s) in 1.1120 seconds

Use the list command to verify the table exists
    hbase(main):007:0> list
    TABLE
    test


STEP 7) finding out more about a table : describe command
issue 'describe' command on hbase shell
    hbase(main):008:0> describe 'test'

    DESCRIPTION                                                              ENABLED
     {NAME => 'test', FAMILIES => [{NAME => 'd', DATA_BLOCK_ENCODING => 'NON true
     E', BLOOMFILTER => 'NONE', REPLICATION_SCOPE => '0', VERSIONS => '3', C
     OMPRESSION => 'NONE', MIN_VERSIONS => '0', TTL => '2147483647', KEEP_DE
     LETED_CELLS => 'false', BLOCKSIZE => '65536', IN_MEMORY => 'false', ENC
     ODE_ON_DISK => 'true', BLOCKCACHE => 'true'}]}


STEP 8) insert some rows into test table
put command works like this:
    put <table name>  <row key>   <column_famly : column>    <value>

    hbase(main):016:0> put 'test', 'r1', 'd:c1', 'foo'
    hbase(main):017:0> put 'test', 'r1', 'd:c2', 'bar'
    hbase(main):017:0> put 'test', 'r2', 'd:c1', 'baz'


STEP 9) find out the contents of the table
issue scan 'table_name' command from hbase shell
    hbase(main):019:0> scan 'test'

output may look similar to:
    ROW                           COLUMN+CELL
     r1                           column=d:c1, timestamp=1365320206055, value=foo
     r1                           column=d:c2, timestamp=1365320238460, value=bar
     r2                           column=d:c1, timestamp=1365320505407, value=baz
     2 row(s) in 0.0420 seconds

Note the timestamps, Hbase inserts timestamps automatically (we can over-ride this)
