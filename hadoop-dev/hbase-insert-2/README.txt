lab : inserting billing details into hBase and querying


STEP 1) edit file : src/hi/hbase/BilllingInsert.java
complete TODOs
Answer : src/hi/hbase/BillingInsertAnswer.java

Edit file : src/hi/hbase/UserScan.java
complete TODOs


STEP 2) compile the code:
  $ cd hbase-insert-2
  $ ../compile2.sh
this should create a jar file called 'a.jar'

STEP 3) generate billing data (CSV) if needed
    $ python ../../data/billing-data/gen-billing-data.py
this should generate bunch of log files in current dir


STEP 4) create '<your name>_billing' table in Hbase.  Replace <your name> with your username
start hbase shell
    $ hbase shell

    hbase > create '<your name>_billing', 'info'
    hbase > exit


STEP 5)
We will load one of the log files into hbase
    $ sh ./insert.sh   2012-01-01.log



STEP 6) query for a particular customer
    $ sh ./scan.sh  <customer id>
e.g.   $ sh ./scan.sh   10

this will scan all billing records for this particular customer and calculate the cost

Question : how long did the scan take?
Question : can this method be used to power a billing dashboard web site?
