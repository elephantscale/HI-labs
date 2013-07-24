Lab : introduction to combiners
project dir : mr-combiner
you can also open the project in eclipse

We are going to two runs.  One without combiner, one with.

== STEP 1) compile the code:
  $ cd mr-combiner
for hadoop 1
  $ ../compile.sh
for hadoop 2
  $ ../compile2.sh
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
edit the file : src/hi/mr/Combiner.java


== STEP 5)
complete the TODO items
Answer : src/hi/mr/CombinerAnswer.java


== STEP 6)
compile the code:
  $ cd mr-combiner
for hadoop 1
  $ ../compile.sh
for hadoop 2
  $ ../compile2.sh
this should create a jar file called 'a.jar'


== STEP 7)
we will run this jar file
  $ hadoop jar a.jar  hi.mr.Combiner   <your name>/billing/in   <your name>/billing/out
Note : if you get an error saying output directory exists, just give it a different output dir  (e.g.  <your name>/billing/out-5)


== STEP 8)
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


