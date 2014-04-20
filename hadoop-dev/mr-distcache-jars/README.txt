Lab : Using third party jar files in mapreduce (using distributed cache)
project dir : mr-distcache-1
you can also open the project in eclipse


So far we have dealt with CSV (comma seperated values) files.  Now we are going to look at how to process JSON records.


== STEP 1) generate json records
script location : <project root dir>/data/billing-data
edit the file : <project root dir>/data/billing-data/gen-billing-data.py
un comment the json generation part around line 35

  def generate_log(timestamp)
    ...
    ...
    dict={'timestamp': timestamp, 'customer_id': customer_id, 'resource_id': resource_id, 'qty': qty,  'cost':cost}
    logline = json.dumps(dict)

    return logline
  ## end





== STEP 2) generate json records
  $ cd <project root dir>
  $ mkdir json
  $ cd json

  $ python  ../../data/billing-data/gen-billing-data.py

inspect the files generated
  $ less 2012-01-01.log

each line should be a valid json


== STEP 3)
copy the json files into HDFS
lets create a seperate dir for the json records

  $ cd <project_dir>
for hadoop 1
  $ hadoop dfs -mkdir <your name>/billing/in-json
  $ hadoop dfs -put   json/*.log   <your name>/billing/in-json

for hadoop 2
  $ hdfs dfs -mkdir <your name>/billing/in-json
  $ hdfs dfs -put   json/*.log   <your name>/billing/in-json


== STEP 4)
    $ cd mr-distcache-jars
edit the file : src/hi/mr/BillingJSON.java
complete the TODO items
Answer : src/hi/mr/BillingJSONAnswer.java


== STEP 5) compile the code:
  $ cd mr-distcache-1
  $ ../compile2.sh
this should create a jar file called 'a.jar'


== STEP 6)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.BillingJSON   <your name>/billing/in-json   <your name>/billing/out

Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  <your name>/billing/out-5)

The above will fail.  Because the GSON library we are using in our map reduce is missing.


== STEP 7)
lets run it with GSON lib
  $ hadoop jar a.jar  hi.mr.BillingJSON   -libjars ../lib/gson-1.6.jar   <your name>/billing/in-json   <your name>/billing/out

did mr job complete successfully?
  inspect program output in terminal

== STEP 8)
Once the mr job is done, inspect the output file:
  $ hadoop  dfs -cat <your name>/billing/out/part-r-00000
or
Browse HDFS file system.  Navigate to '/user/<your user name>/billing/out' dir
(see ../getting-started.txt for detailed instructions)


== STEP 9)
examine the job stats from job tracker UI
go to  http://<job tracker>:50030
       http://localhost:50030

Find the job under 'completed jobs' section
Click on it
inspect the stats
