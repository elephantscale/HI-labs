Lab : Using third party jar files in mapreduce (using distributed cache)
project dir : mr-distcache-1
you can also open the project in eclipse


So far we have dealt with CSV (comma seperated values) files.  Now we are going to look at how to process JSON records.


STEP 1) generate json records
there are two flavors of data-gen scripts : ruby and python

If using Ruby:
edit  file : scripts/gen-billing-data.rb
comment out json generation around line 35:

def generate_log(timestamp)
  ...
  ...
  #json
  dict = {"timestamp" =>  timestamp,
    "customer_id" =>  customer_id,
    "resource_id" => resource_id,
    "qty" => zone_id,
    "cost" => cost
  }
  logline = JSON::generate(dict)
  logline
end

If you are using PYTHON:
edit the file : scripts/gen-billing-data.py
un comment the json generation part around line 35

  def generate_log(timestamp)
    ...
    ...
    dict={'timestamp': timestamp, 'customer_id': customer_id, 'resource_id': resource_id, 'qty': qty,  'cost':cost}
    logline = json.dumps(dict)

    return logline
  ## end





STEP 2) generate json records
  $ cd scripts

if using ruby
  $ ruby gen-billing-data.rb

if using python
  $ python  gen-billing-data.py

inspect the files generated
  $ less 2012-01-01.log

each line should be a valid json


STEP 3)
copy the json files into HDFS
lets create a seperate dir for the json records
  $ hadoop dfs -mkdir billing/in-json
  $ cd <project_dir> / scripts
  $ hadoop dfs -put *.log   billing/in-json


STEP 4)
edit the file : mr-distcache-1/src/hi/mr/BillingJSON.java
complete the TODO items
Answer : mr-distcache-1/src/hi/mr/BillingJSONAnswer.java

STEP 5) compile the code:
  $ cd mr-distcache-1
  $ ../compile.sh
this should create a jar file called 'a.jar'

STEP 6)
we will run this jar file
  $ cd mr-distcache-1
  $ hadoop jar a.jar  hi.mr.BillingJSON   billing/in-json   billing/out

Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  billing/out-5)

The above will fail.  Because the GSON library we are using in our map reduce is missing.

STEP 7)
lets run it with GSON lib
  $ cd mr-distcache-1
  $ hadoop jar a.jar  hi.mr.BillingJSON   -libjars ../lib/gson-1.6.jar   billing/in-json   billing/out

did mr job complete successfully?
  inspect program output in terminal

STEP 8)
Once the mr job is done, inspect the output file:
  $ hadoop  dfs -cat billing/out/part-r-00000
or
Browse HDFS file system.  Navigate to '/user/<your user name>/billing/out' dir
(see ../lab-notes.txt for detailed instructions)


STEP 9)
examine the job stats from job tracker UI
go to  http://<job tracker>:50030
       http://localhost:50030

Find the job under 'completed jobs' section
Click on it
inspect the stats

