Running mapreduce examples that ship with Hadoop.
    Grep : look for keywords in files

Note :
In the following steps replace MY_NAME with your name

== STEP 1)
    lets copy some files into hdfs, we will use Hadoop config files

    prepare a directory in hdfs
        $ hdfs dfs -mkdir -p MY_NAME/grep/in

    copy hadoop config files from /etc/hadoop/conf  into HDFS
        $ hdfs dfs -put /etc/hadoop/conf/*   MY_NAME/grep/in


== STEP 2) running grep
    to find grep usage
        $ hadoop   org.apache.hadoop.examples.Grep

    it will print out the usage
        first arg : input dir
        second arg : output dir
        third arg : pattern to look for

    now lets run the command, look for string 'dfs'

        $ hadoop org.apache.hadoop.examples.Grep   MY_NAME/grep/in   MY_NAME/grep/out   'dfs'

    This command will kick off mapreduce jobs


== STEP 3) Watch the mapreduce output on the console
Also watch the job progress in YARN UI (Resource Manager UI)  or Hue UI
Q : How many jobs are running for grep?


== STEP 4) verifying run output
    grep output will be in the output dir (MY_NAME/grep/out)
    see files in the output dir

        $ hdfs dfs -ls MY_NAME/grep/out

    use 'cat' command to see the file contents

        $ hdfs dfs -cat MY_NAME/grep/out/part-r-00000


== STEP 5)  look for multiple words
    grep for two strings 'dfs' and 'xml'
    hint : the regular expression is :  '(dfs|xml)'  (keep the single quotes)


== BONUS LAB )
    lets do a unix grep on the files
        $   grep -c 'dfs'   /etc/hadoop/conf/*

    note the count
    what is the count from Hadoop grep
    do they agree?  if not why not?




== BONUS LAb ) grep on large files:
    $  cd <my name>  # go to your workspace
    $  cd HI-labs/data/twinkle
    $  ./create-data-files.sh

This will produce files of various sizes... copy 1G.data files into HDFS

    $   hdfs   dfs -mkdir  -p    MY_NAME/twinkle/in
    $   hdfs   dfs -put   1G.data  MY_NAME/twinkle/in

Now re-run the mr-grep example on the large file  'MY_NAME/twinkle/in' .
Look for the word 'diamond'
How many Maps are launched ?
Can you figure out why?

== BONUS LAB)
More examples are in 'hadoop-examples-*.jar'
This jar file can be  found in: 
    - Hortonworks :  /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples*.jar
    - Cloudera : /opt/cloudera/parcels/CDH/jars/hadoop-examples.jar

To find what mapreduce examples are available
    $ hadoop jar /path/to/hadoop-mapreduce-examples*.jar
    e.g.
    $ hadoop jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples*.jar  
 
This will print out sample programs available

