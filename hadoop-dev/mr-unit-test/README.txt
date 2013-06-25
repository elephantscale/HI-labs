Lab : unit testing map / reduce
project dir : mr-unit-test
you can also open the project in eclipse (recommended)


STEP 1) edit the file :  mr-unite-test/src/hi/mr/MapperTest.java

STEP 2) complete the TODO items

STEP 3) compile the code:
  $ cd mr-unit-test
  $ ../compile.sh
this should create a jar file called 'a.jar'

STEP 4)  run the unit test
From command line:
  $ ./run-test.sh
    or
  $ sh run-test.sh


To run the test from Eclipse:
    - open the project 'mr-unit-test' in eclipse
    - Right click on MapperTest.java  --> Run As --> Junit Test

Note : We don't need hadoop running to execute this unit test.  This is a good thing!  As we can develop unit tests in our own development environment (e.g. eclipse)

STEP 5) Inspect the results
In Commnad line:
    Jnit will print out test run summary.  You'd want to make sure all tests pass

In Eclipse:
    watch the console and junit windows in Eclipse for results
