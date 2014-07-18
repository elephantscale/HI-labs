Pig Intro Lab : learning pig concepts
project dir : pig-intro

=== STEP 1) start up the GRUNT shell using pig
        $ pig
make sure pig can connect to HDFS and MapReduce
exit pig shell by typing    quit;


=== STEP 2)
Edit and run the following files
    intro.pig
    filter.pig
    foreach.pig
    groupby.pig

e.g :   $  pig intro.pig


=== TIPS

To change the name of pig script supply 'job.name' parameter
    $ pig -Djob.name="hello"  script.pig
---
Turning off logging in pig

    create a log.conf file with this line
      log4j.rootLogger=FATAL

    invoke pig with -4 arg
      $ pig -4 log.conf   script.pig
---
'echoing' execution line by line   (like sh -x)
    $   pig   < script.pig
---