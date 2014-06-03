Lab : calculate customer itemized bill

JDK API docs : http://docs.oracle.com/javase/7/docs/api/
Hadoop API docs : http://hadoop.apache.org/docs/stable/api/

project dir : mr-billing-itemized
you can also open the project in eclipse
(use  'mvn eclipse:eclipse'  to create eclipse project files)

== STEP 1)
    $ cd mr-billing-itemized
edit the file : src/hi/mr/ItemizedBilling.java
complete the TODO items

(instructor :  answer file : /labs-solutions/hadoop/mr/mr-billing-itemized)


== STEP 2)
compile the code:
  $ cd mr-billing-itemized
  $ ../compile.sh
this should create a jar file called 'a.jar'


== STEP 3)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.ItemizedBilling   <your name>/billing/in/sample.txt   <your name>/billing/out

Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  <your name>/billing/out-5)


== STEP 4)
Once the mr job is done, inspect the output file:
  $ hdfs  dfs -cat <your name>/billing/out/part-r-00000
or
Browse HDFS file system  navigate to '/user/<login name>/<your user name>/billing/out'  dir
(see ../getting-started.txt for detailed instructions)


== STEP 5) Skip this step, if you have already generated data in billing/in  directory
Once the sample data is working, lets try this on more data.

Generate more (random) sample data
    $  python ../../data/billing-data/gen-billing-data.py
This would generate a bunch of *.log files

Inspect a log file
    $  head  2012-01-01.log

Quiz : How many records have we generated?

Now lets copy the newly generated log files into HDFS
    $  hdfs  dfs -put   *.log    <your name>/billing/in/

Verify the files are there
    $  hdfs  dfs -ls <your name>/billing/in


== STEP 6)
run mr again on this new data
  $ hadoop jar a.jar  hi.mr.ItemizedBilling   <your name>/billing/in   <your name>/billing/out2

note 1 : we are supplying an input dir (not a single file)
note 2 : specified a different output dir


== STEP 7)
inspect the output (<your name>/billing/out2  dir) from HDFS UI


== STEP 8)
examine the job stats from job tracker UI
Find the job under 'completed jobs' section
Click on it
inspect the stats
