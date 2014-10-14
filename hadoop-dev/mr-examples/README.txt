Running mapreduce examples that ship with Hadoop


== STEP 1)
    lets copy some files into hdfs, we will use Hadoop config files

    prepare a directory in hdfs
        $ hdfs dfs -mkdir -p <your_name>/grep/in

    copy hadoop config files from /etc/hadoop/conf  into HDFS
        $ hdfs dfs -put /etc/hadoop/conf/*   <your_name>/grep/in


== STEP 2) running grep
    to find grep usage
        $ hadoop   org.apache.hadoop.examples.Grep

    it will print out the usage
        first arg : input dir
        second arg : output dir
        third arg : pattern to look for

    now lets run the command, look for string 'dfs'

        $ hadoop org.apache.hadoop.examples.Grep   <your_name>/grep/in   <your_name>/grep/out   'dfs'

    This command will kick off mapreduce jobs


== STEP 3) Watch the mapreduce output on the console
Also watch the job progress in YARN UI  or Hue UI
Q : How many jobs are running for grep?


== STEP 4) verifying run output
    grep output will be in the output dir (<your_name>/grep/out)
    see files in the output dir

        $ hdfs dfs -ls <your_name>/grep/out

    use 'cat' command to see the file contents

        $ hdfs dfs -cat <your_name>/grep/out/part-r-00000


== STEP 5)  look for multiple words
    grep for two strings 'dfs' and 'xml'
    hint : the regular expression is :  '(dfs|xml)'


== BONUS LAB )
    lets do a unix grep on the files
        $   grep -c 'dfs'   /etc/hadoop/conf/*

    note the count
    what is the count from Hadoop grep
    do they agree?  if not why not?


== BONUS LAB)
More examples are in 'hadoop-examples-*.jar'
This jar file usually found in :  /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples*.jar
(might be located under /opt  for some distributions
use the following command to locate the file
    $   find /opt   | grep hadoop-mapreduce-exmamples.jar
)

Find what mapreduce examples are available

$ hadoop jar /path/to/hadoop-mapreduce-examples*.jar
e.g.
$ hadoop jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples*.jar

This will print out sample programs available
