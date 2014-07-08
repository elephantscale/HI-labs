This lab teaches the use of Flume
----
To instructor :
    - each student can install flume on his node in the cluster. Alternatively, they can work in groups, so that each group has a node assigned to it

    - each student can work in his own copy of the directory, generating data under his or her name

== STEP 1)  Installing Flume
 Use the instance provided by the instructor. Log in using SSH
 e.g
    ssh ec2-user@your_host_name

== STEP 2) execute the following commands on the terminal
    sudo yum install --assumeyes flume-ng

Please note that if you already installed Hadoop cluster, such as with CDH5, Flume may be already installed
If not, you may also need to add the Cloudera or another repository from which to install Flume

== STEP 3) execute the following commands on the terminal
  Using sudo, create a new file names /etc/hadoop/conf/flume-conf.properties
  Take the file /usr/lib/flume-ng/conf/flume-conf.properties.template as a starting point

== STEP 4) generate data in the access log
  cd to the /HI-labs/data/scripts directory
  run the data generating script: python gen-log-data.py
  this will give you a number of log files: 0.log, 1.log, 2.log, and so on. You will be able to append data to you main log files, such as cat 1.log >> <your-log-file>
  
== STEP 5) start collector in second terminal window
  Use flume-ng command

== STEP 6) start the source in third terminal window
  Use flume-ng command

== STEP 7) observe the files in HDFS
  Use 'hdfs dfs -ls' command



