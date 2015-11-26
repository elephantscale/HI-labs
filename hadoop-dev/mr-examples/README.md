# Running mapreduce examples that ship with Hadoop.

## Grep : look for keywords in files

**Note :**  
In the following steps replace MY_NAME with your name

## STEP 1) Stage files into HDFS
Lets copy some files into hdfs. We will use Hadoop config files.

```bash
        # prepare a input directory in HDFS
        $   hdfs dfs -mkdir -p    MY_NAME/grep/in

        #  copy hadoop config files from /etc/hadoop/conf  into HDFS
        $   hdfs dfs -put /etc/hadoop/conf/*.xml   MY_NAME/grep/in
```

## STEP 2) Running grep
To find grep usage
```
        $ hadoop   org.apache.hadoop.examples.Grep
```

It will print out the usage
- first arg : input dir
- second arg : output dir
- third arg : pattern to look for

Now lets run the command, look for string `dfs`
```bash
        #  we are using the time prefix  to measure the time taken
        $   time  hadoop org.apache.hadoop.examples.Grep   MY_NAME/grep/in   MY_NAME/grep/out   'dfs'
```
This command will kick off mapreduce jobs


## STEP 3) Watch the mapreduce progress
**=> Watch Mapreduce progress on console**  

**=> Also watch the job progress in YARN UI (Resource Manager UI)  or Hue UI** 

**=> Q : How many jobs are running for grep?**  

**=> Q : How long did the mapreduce job take?**  
See the output by time command, look for `real` value
```bash
real    1m19.162s  <-- this is the actual time
user    0m10.628s
sys     0m0.998s
```


## STEP 4) Verifying run output
Grep output will be in the output dir `MY_NAME/grep/out`.   
See files in the output dir.

```bash
        $   hdfs dfs -ls MY_NAME/grep/out

        # use 'cat' command to see the file contents
        $   hdfs dfs -cat   MY_NAME/grep/out/*
```


## STEP 5)  Look for multiple words
Grep for two strings `dfs` and `xml`.   
Hint : the regular expression is :  `'(dfs|xml)'`  (keep the single quotes)


## BONUS LAB ) Unix grep
Lets do a unix grep on the files
```bash
        # prefixing time to measure time taken
        $   time  grep -c 'dfs'   /etc/hadoop/conf/*
```

Console output may look like...
```console
/etc/hadoop/conf/core-site.xml:3
/etc/hadoop/conf/hdfs-site.xml:16
/etc/hadoop/conf/mapred-site.xml:0
/etc/hadoop/conf/ssl-client.xml:0
/etc/hadoop/conf/yarn-site.xml:0

real    0m0.005s  <- time taken
user    0m0.002s
sys     0m0.002s
```

Note the count.  
What is the count from Hadoop grep?  

**=> Q :  Do they agree?  if not why not?**  

**=> Discussion : Also note the time taken by unix grep command.  Why is it so much shorter than Hadoop?**  



## BONUS Lab 1: Grep on large files:
```bash
    $  cd   <my name>  # go to your workspace
    $  cd   HI-labs/data/twinkle
    $  ./create-data-files.sh
```

This will produce files of various sizes.  
Copy 1G.data files into HDFS.
```bash
    $   hdfs   dfs -mkdir  -p    MY_NAME/twinkle/in
    $   hdfs   dfs -put   1G.data  MY_NAME/twinkle/in
```

Now re-run the mr-grep example on the large file  `MY_NAME/twinkle/in`.    
Look for the word `diamond`.  
How many Maps are launched ?  
Can you figure out why?  

## BONUS LAB 2: More Hadoop Examples
More examples are in `hadoop-examples-*.jar`.   
This jar file can be  found in: 
- Hortonworks :  /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples*.jar
- Cloudera : /opt/cloudera/parcels/CDH/jars/hadoop-examples.jar

To find what mapreduce examples are available
```bash
        $ hadoop jar /path/to/hadoop-mapreduce-examples*.jar
e.g.    $ hadoop jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples*.jar  
```
 
This will print out sample programs available.

