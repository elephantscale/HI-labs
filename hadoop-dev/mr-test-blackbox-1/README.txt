Lab : Test mapreduce program
project dir : mr-test-blackbox-1

== STEP 1)
    $  cd mr-test-blackbox-1
    edit the file : src/hi/mr/BillingTotalTest.java


== STEP 2) complete the TODO items
    Answer : src/hi/mr/BillingTotalAnswer.java


== STEP 3) compile the code:
    for hadoop 1
      $ ../compile.sh

    for hadoop 2
      $ ../compile2.sh

    this should create a jar file called 'a.jar'


== STEP 4)
    Now it is time to copy the sample input into HDFS
    for hadoop 1
        $ hadoop dfs -mkdir  <your name>/billing/in
        $ hadoop dfs -put  ../../data/billing-data/sample.txt   <your name>/billing/in/

    for hadoop 2
        $ hdfs dfs -mkdir  <your name>/billing/in
        $ hdfs dfs -put  ../../data/billing-data/sample.txt   <your name>/billing/in/


== STEP 5)
    edit test.sh file, and complete TODO items


== STEP 6)
    run the test.sh script
    $  sh -x test.sh

    This script will
        - run the mapreduce job,
        - get the output
        - and compare with expected output


== Bonus Lab)
    can you send an email when the test fails?
