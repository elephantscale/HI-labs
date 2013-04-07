Pig UDF lab 
project dir : pig-

In this lab we are going to create a UDF (User defined function)
to truncate a domain name to just its name; e.g. www.facebook.com ->
facebook.

STEP 1) View the compile.sh in the directory, and fix the location of your
pig install.  e.g., /usr/lib/pig

STEP 2) View the ShortDomainName.java file.  Notice that the signature of the
UDF.

STEP 3) Complete the lab exercise by shortening the domain name. 

STEP 4) Compile and create a jar by using the included compile.sh.  If there
are problems, correct them and compile again.

STEP 5) View the pig-udf.pig Make sure the paths to sample input and myudf.jar are correct.

Step 6) run the script
$ pig pig-udf.pig

STEP 6) Check the output
