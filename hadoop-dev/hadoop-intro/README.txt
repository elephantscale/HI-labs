Welcome to Hadoop Illuminated, lab 1

Introduction
In this lab we will check to ensure that Hadoop is running on your
system and be able to get famliar with the user interface.


Lab Goals:

1. View the Hadoop Daemons running on your system.
2. Learn how to view which daemons are running
3. Examine the web interfaces for the Namenode, JobTracker, and
TaskTracker daemons.


Step 1) View running java processes; look for hadoop daemons
$ ps -eaf | grep java
hduser   11930     1  0 Mar05 pts/2    00:07:32
/usr/lib/jvm/java-6-oracle/bin/java -Dproc_namenode -Xmx1000m ...
... and so on ...

Step 2) Run jps to see if there
$ jps
12940 JobTracker
4902 Jps
13295 TaskTracker
12462 DataNode
12847 SecondaryNameNode
11930 NameNode

Step 3) Ensuring that the Hadoop command works

$ hadoop
Usage: hadoop [--config confdir] COMMAND

You can fix your path in this shell window by using the following command:
$ export PATH=$PATH:/path/to/hadoop/location/bin

Step 4) View NameNOde web interface.
Open a browser to http://localhost:50070/

(lynx users can simply type:
$ lynx http://localhost:50070/
)

Step 5) Open JobTracker at:

http://localhost:50030/

Step 6) Open TaskTracker at:

http;//localhost:50060/

Lab Review

1. Hadoop consists of 5 daemons: NameNode, SecondaryNameNode,
DataNode, JobTracker, and TaskTracker.  A pseudo-distributed system
has all 5 daemons running on one machine, which is common for
developers.

2. One can quickly verify that daemons are running using the ps -eaf
or the jps command.

3. It is important to make sure your hadoop/bin directory is in your
path. This could be located at /usr/lib/hadoop/bin, but varies based
on distribution.

4. The NameNode, JobTracker, and TaskTracker daemons can be interfaced
with their respective web interfaces.

Conclusion

You're done -- congradulations!  You just checked to make sure that
your Hadoop daemons are running, you ensured your path was set up
properly, and then you viewed the web interface for three of your
Hadoop Daemons.



