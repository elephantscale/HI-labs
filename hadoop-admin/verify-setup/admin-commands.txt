HH = hadoop_home

VERSION
------
    $   HH/bin/hadoop version


COPY FILES
-----
copy file into HDFS
    $   HH/bin/hadoop dfs -put  ~/README.txt   /

verify
    $   HH/bin/hadoop dfs  -lsr  /


DFSAdmin command line
--------------------

    $ HH/bin/hadoop  dfsadmin
will print out usage

quick report:
    $ HH/bin/hadoop  dfsadmin -report



MR Admin
--------
to see usage:
    $  HH/bin/hadoop  mradmin


JOBS
----
to see usage:
    $  HH/bin/hadoop  job


e.g. list all running jobs
    $  HH/bin/hadoop   job -list
