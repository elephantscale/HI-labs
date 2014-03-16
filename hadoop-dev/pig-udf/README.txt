Pig UDF lab 
project dir : pig-udf

In this lab we are going to create a UDF (User defined function)
to extract the 'month' from millisecond timestamp.

== STEP 1) 
View the file : src/hi/udf/MonthFromMilliSeconds.java


== STEP 2)
compile the code :  ../compile2.sh
This will create a jar file a.jar


== STEP 3)
edit the pig script udf.pig.
update the TODO items
Notice how the UDF is registered and used.


== STEP 4) 
run the script
    $ pig udf.pig


== STEP 5)
validate the output.
If it looks correct, run this on complete set of data
