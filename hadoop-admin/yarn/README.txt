This lab teaches the install of YARN
----
To instructor :
    - each student can install YARN on a server provided for him or her. Alternatively, they can work in groups, so that each group has a node assigned to it

== STEP 1)  Download Hadoop

  Start with this URL in the browser: http://hadoop.apache.org/releases.html#Download. Find the right link, then login to your instance.
  Use the instance provided by the instructor. Log in using SSH
  e.g
    ssh ec2-user@your_host_name
    Download the link you found with the browser
    for example, wget http://mirrors.gigenet.com/apache/hadoop/common/hadoop-2.4.0/hadoop-2.4.0.tar.gz

== STEP 2) 
  
  Unpack Hadoop files
  sudo mkdir /opt/yarn
  cd /opt/yarn
  sudo tar xvzf ~/hadoop-2.4.0.tar.gz

== STEP 3) Java setup

  Install Java if you don't have it. Hadoop will work with many version, here is the list http://wiki.apache.org/hadoop/HadoopJavaVersions
  Make sure your JAVA_HOME is set
  You may need it to work in all accounts, for example, using this command
  sudo -i
  echo "export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_45" > /etc/profile.d/java.sh
  source /etc/profile.d/java.sh
  exit (stop being root)
  Alternatively, if you get "JAVA_HOME not defined" error, set it in here
  sudo vi hadoop-env.sh 

== STEP 4) Create groups and users

  sudo groupadd hadoop
  sudo useradd -g hadoop yarn
  sudo useradd -g hadoop hdfs
  sudo useradd -g hadoop mapred

== STEP 5) Create directories

  sudo mkdir -p /var/data/hadoop/hdfs/nn
  sudo mkdir -p /var/data/hadoop/hdfs/snn
  sudo mkdir -p /var/data/hadoop/hdfs/dn
  sudo mkdir -p /var/log/hadoop/yarn
  sudo chown hdfs:hadoop /var/data/hadoop/hdfs -R
  sudo chown yarn:hadoop /var/log/hadoop/yarn -R  

  Move to the Hadoop installation root and create the logs directory
  cd /opt/yarn/hadoop-2.4.0
  sudo mkdir logs
  sudo chmod g+w logs
  sudo chown yarn:hadoop . -R

== STEP 6) Configure

  From the same hadoop root install directory as in step 5), edit the core site configuration
  sudo vi etc/hadoop/core-site.xml (or nano)

  Put the following in the configuration

  <configuration>
    <property>
      <name>fs.default.name</name>
      <value>hdfs://localhost:9000</value>
    </property>
    <property>
      <name>hadoop.http.staticuser.user</name>
      <value>hdfs</value>
    </property>
  </configuration>

  Edit the hdfs site configuration
  sudo vi etc/hadoop/hdfs-site.xml

  Put the following in the configuration

  <configuration>
    <property>
      <name>dfs.replication</name>
      <value>1</value>
    </property>
    <property>
      <name>dfs.namenode.name.dir</name>
      <value>file:/var/data/hadoop/hdfs/nn</value>
    </property>
    <property>
      <name>fs.checkpoint.dir</name>
      <value>file:/var/data/hadoop/hdfs/snn</value>
    </property>
    <property>
      <name>fs.checkpoint.edits.dir</name>
      <value>file:/var/data/hadoop/hdfs/snn</value>
    </property>
    <property>
      <name>dfs.datanode.data.dir</name>
      <value>file:/var/data/hadoop/hdfs/dn</value>
    </property>
  </configuration>

  Configure the mapred-site.xml
  Start by copying a template
  
  sudo cp etc/hadoop/mapred-site.xml.template  etc/hadoop/mapred-site.xml
  sudo vi etc/hadoop/mapred-site.xml
  Add the following in the configuration

  <configuration>
    <property>
      <name>mapreduce.framework.name</name>
      <value>yarn</value>
    </property>
  <configuration>

  Configure yarn site

  sudo vi etc/hadoop/yarn-site.xml

  <configuration>
    <property>
      <name>yarn.nodemanager.aux-services</name>
      <value>mapreduce.shuffle</value>
    </property>
    <property>
      <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
      <value>org.apache.hadoop.mapred.ShuffleHandler</value>
    </property>
  </configuration>


NOTE. The configuration is done. It will be for your own benfit to put the 'bin' directory of Hadoop on your PATH.

== STEP 7) Format HDFS

  sudo -u hdfs bin/hdfs namenode -format

  There should be no errors, or else read the error message and fix configuration files

== STEP 8) Start the HDFS services

  cd ../sbin
  sudo -u hdfs ./hadoop-daemon.sh start namenode
  sudo -u hdfs ./hadoop-daemon.sh start secondarynamenode
  sudo -u hdfs ./hadoop-daemon.sh start datanode

  Verify with
  sudo jps (you should see the daemons)

== STEP 9) Fix home directory

  From the bin directory

  sudo -u hdfs ./hdfs dfs -mkdir /user/
  sudo -u hdfs ./hdfs dfs -mkdir /user/<your-user-name>
  sudo -u hdfs ./hdfs dfs -chown <your-user-name> /user/<your-user-name>

== STEP 10) Start YARN services

  cd YARN_HOME/sbin
  sudo -u yarn ./yarn-daemon.sh start resourcemanager
  sudo -u yarn ./yarn-daemon.sh start nodemanager

== STEP 11) Verify in the browser

  HDFS

  http://localhost:50070

  Resource Manager

  http://localhost:8088/cluster

  run as user hdfs. For example sudo -i; su - hdfs

  from HOME_HOME

  bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.4.0.jar pi 10 20
