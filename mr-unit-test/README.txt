Lab : unit testing map / reduce
project dir : mr-unit-test
you can also open the project in eclipse (recommended)


STEP 1) edit the file :  mr-unite-test/src/hi/mr/MapperTest.java

STEP 2) complete the TODO items

STEP 5) compile the code:
  $ cd mr-unit-test
  $ ../compile.sh
this should create a jar file called 'a.jar'

STEP 6)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.Counter   billing/in/bad_records.txt   billing/out

Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  billing/out-5)

STEP 6)
Once the mr job is done, inspect the output file:
  $ hadoop  dfs -cat billing/out/part-r-00000
or
Browse HDFS file system.  Navigate to '/user/<your user name>/billing/out' dir
(see ../lab-notes.txt for detailed instructions)


STEP 7)
inspect the counters
A) by the output produced by MR
B) from job tracker UI
  go to http://<job tracker>:50030
        http://localhost:50030
  find the job under 'completed jobs' section
  click on job stats page
  inspect the BAD_RECORDS  counter


