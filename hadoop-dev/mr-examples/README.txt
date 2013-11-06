Running mapreduce examples that ship with Hadoop

These examples are in 'hadoop-examples-*.jar'
On Cloudera 4.x releases, this jar file is in /usr/lib/hadoop-0.20-mapreduce/hadoop-examples.jar

== STEP 1)
    Find what mapreduce examples are available

    $ hadoop jar /usr/lib/hadoop-0.20-mapreduce/hadoop-examples.jar

    This will print out sample programs available


== STEP 2) grep mapreduce
    find usage:
    $ hadoop jar /usr/lib/hadoop-0.20-mapreduce/hadoop-examples.jar  grep


== STEP 3)
    lets copy some files into hdfs, we will use Hadoop config files

    prepare a directory in hdfs
        $ hdfs dfs -mkdir <your_name>/grep/in

    copy hadoop config files from /etc/hadoop/conf  into HDFS
        $ hdfs dfs -put /etc/hadoop/conf/*   <your_name>/grep/in


== STEP 4) running grep
    to find grep usage
        $ hadoop jar /usr/lib/hadoop-0.20-mapreduce/hadoop-examples.jar grep 

    it will print out the usage
        first arg : input dir
        second arg : output dir
        third arg : pattern to look for

    now lets run the command, look for string 'dfs'

        $ hadoop jar /usr/lib/hadoop-0.20-mapreduce/hadoop-examples.jar grep  <your_name>/grep/in   <your_name>/grep/out   'dfs'

    This commnad will kick off mapreduce jobs


== STEP 5) verifying run output
    grep output will be in the output dir (<your_name>/grep/out)
    see files in the output dir

        $ hdfs dfs -ls <your_name>/grep/out

    use 'cat' command to see the file contents

        $ hdfs dfs -cat <your_name>/grep/out/part-00000


== BONUS LAB )
    lets do a unix grep on the files
        $   grep -c 'dfs'   /etc/hadoop/conf/*

    note the count
    what is the count from Hadoop grep
    do they agree?  if not why not?
