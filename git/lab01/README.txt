Introduction

In this lab we will ensure that Git is installed on your
system and be able to get famliar with the user interface.


Lab Goals:

1. Install Hadoop in Windows, Mac or Linux.
2. Learn how to view which daemons are running
3. Examine the web interfaces for the Namenode, JobTracker daemons.


== STEP 1)  Install Git.


== STEP 2) View running java processes; look for hadoop daemons
    use 'jps' command
    Output may look like the following

    (In some installations, jps may not be in path.
    e.g. in hortonworks installs jps is in /usr/jdk64/jdk1.7.0_45/bin/jps
    substitute this for the command)

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


== STEP 4) View NameNode web interface.
    Open a browser and go to Namenode UI (Instructor will provide details)

    question : what is the version of HDFS?
    question : how many nodes in the cluster?
    question : what is the capacity of HDFS?


== STEP 5) Inspect YARN / JobTracker  UI
   Open a browser and go to YARN / Job Tracker UI (Instructor will provide details)

   question : how many nodes?


== STEP 6) Inspect HUE UI
    Open Hue Web UI.
    (Instructor will provide credentials)
