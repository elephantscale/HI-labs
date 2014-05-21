Lab : Co-Processor
-------------
CO Processors
    http://blogs.apache.org/hbase/entry/coprocessor_introduction

== STEP 1) Edit co-processor code
    edit file : src/main/java/hi/hbase/MyCoProcessor.java
fix TODO items


== STEP 2) compile the code
from within co-processor dir
    $  ../compile.sh
This will create a jar file a.jar


== STEP 3) stage co-processor jar to HDFS

Create your a directory in HDFS to to store your jars
    $    hdfs   dfs  -mkdir   <your_name>
(change <your_name> to yours)

copy the jar file:
    $    hdfs  dfs -put   a.jar  <your_name>/a.jar


== STEP 4)  Adding co-processor to hbase table
from hbase shell:
    $ hbase shell

    hbase shell> disable '<your_name>_users'

    hbase shell> alter '<your_name>_users', METHOD => 'table_att', 'coprocessor' => 'hdfs://<namenode_ip_address>:8020/users/ec2-user/<your_name>/a.jar|hi.hbase.MyCoProcessor|10'

    hbase shell> enable '<your_name>_users'

 check if coprocessor is loaded
    hbase shell > describe '<your_name>_users'


== STEP 5) Create the second table (users_by_email)
    $  hbase shell
    hbase shell>   create '<your_name>_users_by_email', 'info'


== STEP 6)  testing co-processor
lets insert some data from hbase shell
    hbase shell>   insert '<your_name>_users',  'user1', 'info:email', 'me@gmail.com'

Now if every thing went according to plan, xxx_users_by_email should have a new entry.  Verify this
    hbase shell>  scan '<your_name>_users_by_email'


== STEP 7)  inspecting logs
HBase logs can be found in  /var/log/hbase
inspect region server logs and indentify logs created by co-processor


== STEP 8) removing a coprocessor
    $  hbase shell

    hbase shell > disable 'xxx_table'

    hbase shell > alter 'xxx_table', METHOD => 'table_att_unset',  NAME => 'coprocessor$1'

    hbase shell > enable 'ev_canonicalId'


== HINT : reloading / updating co-processor
    - disable table
    - remove coprocessor
    - re-add coprocessor
    - enable table
