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
