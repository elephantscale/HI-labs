Hadoop Administration - Single Node install
---

Lab goal : install and configure hadoop on a single node


-- step 1)
Login into the linux node.  Instructor will provide credentials



-- step 2)
verify that password-less ssh is working on this node
    $  ssh localhost
say yes to the prompt


-- step 3)
verify the following files are in ~ directory
    hadoop install file : ~/software/hadoop/apache
    java installer : ~/software/java


-- step 4) install java (if it is not installed, otherwise go to step 5)
    $  cd ~/software/java
    $  use the jdk-7u67-linux-x64.tgz


-- step 5)
verify that java is installed
    $ java -version

you should see output similar to the following
    java version "1.7.0"
    Java(TM) SE Runtime Environment (build 1.7.0)


-- step 6)
we will install hadoop using TAR file format.
verify that the hadoop tarball exists in   ~/software/hadoop/apache/hadoop-1.1.2-bin.tar.gz
(version numbes 1.1.2 might be different on your node)


-- step 7)
untar hadoop file under home directory
    $  cd    #  <-- so you are in home dir
    $  tar xf ~/software/hadoop/apache/hadoop-1.1.2-bin.tar.gz
    $  mv hadoop-1.1.2 hadoop   (adjust if your version is different)
    
now we have hadoop program files in  ~/hadoop  dir.  

verify the following directories exist under ~/hadoop
    bin
    conf
    lib
    sbin


-- step 8)
create a data dir for hadoop
    $  mkdir ~/hadoop/hadoop-data


Next, we will configure Hadoop.  Hadoop configuration file are in  ~/hadoop/conf dir.

Minimal configuration files are provided in ~/hi/config/hadoop-single directory.  We will copy these files into ~/hadoop/conf dir


-- step 9)

Edit file ~/hadoop/conf/hadoop-env.sh
and update the JAVA_HOME variable
    export JAVA_HOME=<your jdk (such as ~/apps/jdk7, without /bin/java>

(optional) also edit the following line (around line 37)
    export HADOOP_SSH_OPTS="-o StrictHostKeyChecking=no"


-- step 10)
copy minimal config files provided into ~/hadoop/conf dir
    $  cp ~/hi/config/hadoop-single/*   ~/hadoop/conf/

inspect the following files:

    conf/core-site.xml
    conf/mapred-site.xml
    conf/hdfs-site.xml
    conf/masters
    conf/slaves


-- step 11)
format namenode storage
    $   ~/hadoop/bin/hadoop namenode -format


-- step 12)
start hadoop deamons
    $  ~/hadoop/bin/start-all.sh


-- step 13)
verify the deamons are running
    $   jps
(if jps is not in path, try  /usr/java/latest/bin/jps)

output will look similar to this
    9316 SecondaryNameNode
    9203 DataNode
    9521 TaskTracker
    9403 JobTracker
    9089 NameNode

We have all deamons running


-- step 14)
Verify UIs by namenode and job tracker
In a browser, go to the following URLs
    namenode UI:   http://machine_host_name:50070
    job tracker UI:   http://machine_host_name:50030

substitute 'machine host name' with public IP of your node
e.g :   http://ec2......com:50070


You have installed and configured hadoop on a single node

[BONUS LAB 1]
explore hadoop-data directories
    $ find /hadoop/hadoop-data
how does hadoop organize data?

[BONUS LAB 2]
Generate a reasonable amount of data using teragen
Sort the data using terasort
Analyze cluster performance
