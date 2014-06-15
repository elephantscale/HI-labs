Lab : introduction to combiners
project dir : mr-combiner

JDK API docs : http://docs.oracle.com/javase/7/docs/api/
Hadoop API docs : http://hadoop.apache.org/docs/stable/api/

you can also open the project in eclipse
(use  'mvn eclipse:eclipse'  to create eclipse project files)

We are going to two runs.  One without combiner, one with.

== STEP 1) compile the code:
  $ cd mr-combiner
  $ ../compile.sh
this should create a jar file called 'a.jar'


== STEP 2)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.Combiner   <your name>/billing/in   <your name>/billing/out
Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  <your name>/billing/out-5)


== STEP 3)
Once the mr job is done, inspect the console output.  Specially the following counters:
    Map input records
    Map output records
    Reduce input records
    Reduce input groups
    Combine input records
    Combine output records
Both Combine records should be zero (we haven't enabled combiner yet)


== STEP 4)
Now we will enable combiner
edit the file : src/main/java/hi/mr/Combiner.java
complete the TODO items


== STEP 5)
compile the code:
  $ cd mr-combiner
  $ ../compile.sh
this should create a jar file called 'a.jar'


== STEP 6)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.Combiner   <your name>/billing/in   <your name>/billing/out
Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  <your name>/billing/out-5)


== STEP 7)
Once the mr job is done, inspect the console output.  Specially the following counters:
    Map input records
    Map output records
    Reduce input records
    Reduce input groups
    Combine input records
    Combine output records
Both Combine records should be > 0
Also examine how Reduce Input Records are less than what they were before
Why is that?

