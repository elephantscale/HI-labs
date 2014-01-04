Lab : calculate customer itemized bill
project dir : mr-billing-itemized
you can also open the project in eclipse

== STEP 1)
    $ cd mr-billing-itemized
    edit the file : src/hi/mr/ItemizedBilling.java


== STEP 2) complete the TODO items
Answer : src/hi/mr/ItemizedBillingAnswer.java


== STEP 3)
compile the code:
  $ cd mr-billing-itemized
for hadoop 1
  $ ../compile.sh

for hadoop 2
  $ ../compile2.sh

this should create a jar file called 'a.jar'


== STEP 4)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.ItemizedBilling   <your name>/billing/in/sample.txt   <your name>/billing/out

Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  <your name>/billing/out-5)


== STEP 5)
Once the mr job is done, inspect the output file:
for hadoop 1
  $ hadoop  dfs -cat <your name>/billing/out/part-r-00000

for hadoop 2
  $ hdfs  dfs -cat <your name>/billing/out/part-r-00000
or
Browse HDFS file system  navigate to '/user/<your user name>/billing/out'  dir
(see ../getting-started.txt for detailed instructions)


== STEP 6)
Once the sample data is working, lets try this on more data.
See ../generating-data.txt  on how to generate more data and copy it into hdfs


== STEP 7)
run mr again on this new data
  $ hadoop jar a.jar  hi.mr.ItemizedBilling   <your name>/billing/in   <your name>/billing/out2

note 1 : we are supplying an input dir (not a single file)
note 2 : specified a different output dir


== STEP 8)
inspect the output (<your name>/billing/out2  dir) from HDFS UI
(see ../getting-started.txt for detailed instructions)


== STEP 9)
examine the job stats from job tracker UI
go to  http://<job tracker>:50030
       http://localhost:50030

Find the job under 'completed jobs' section
Click on it
inspect the stats
