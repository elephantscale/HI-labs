Introduction
In this lab we will check to ensure that Hadoop is running on your
system and be able to get famliar with the user interface.


Lab Goals:

1. View the Hadoop Daemons running on your system.
2. Learn how to view which daemons are running
3. Examine the web interfaces for the Namenode, JobTracker daemons.


== STEP 1)  login to Hadoop cluster.  Instructor will provide details


== STEP 2) View running java processes; look for hadoop daemons
    use 'jps' command

    $ jps
        4902 Jps
        12940 JobTracker
        13295 TaskTracker
        12462 DataNode
        12847 SecondaryNameNode
        11930 NameNode

    If the above doesn't produce any output try
    $  sudo jps
    or
    $  sudo /usr/java/latest/bin/jps

    to see more details of the process

    $ ps -eaf | grep java



== STEP 3) Ensuring that the Hadoop command works

    $ hadoop
    Usage: hadoop [--config confdir] COMMAND

    If you get 'command not found' message, fix your path in this shell window by using the following command:
        $ export PATH=$PATH:/path/to/hadoop/location/bin


== STEP 4) View NameNOde web interface.
    Open a browser and go to url  http://<name node host>:50070
    e.g:
        http://localhost:50070
        http://ec2......:50070

    question : what is the version of HDFS?
    question : how many nodes in the cluster?
    question : what is the capacity of HDFS?


== STEP 5) Open JobTracker at:
   url :   http://<job tracker host>:50030
   e.g. :
        http://localhost:50030
        http://ec2......:50030

    question : how many nodes?
