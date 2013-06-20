Prepare a machine for hadoop install
-------

====================
NTP
- is NTP running?
    $   ps -ef | grep ntp
    try the following commands
        ntptime
        ntpstat

- make sure ntp is installed

- verify   /etc/ntp.conf  is configured correctly

- start ntp
    $ sudo service ntpd stop
    $ sudo ntpdate 1.centos.pool.ntp.org
    $ sudo service ntpd start

====================

Ulimit
    $ ulimit -a

if hadoop is running as hdfs, mapred users
    $ sudo -u hdfs  ulimit -a
    $ sudo -u mapred  ulimit -a

if hbase is installed as hbase user
    $ sudo -u hbase  ulimit -a

output might look like:
    core file size          (blocks, -c) 0
    data seg size           (kbytes, -d) unlimited
    scheduling priority             (-e) 0
    file size               (blocks, -f) unlimited
    pending signals                 (-i) 28656
    max locked memory       (kbytes, -l) 64
    max memory size         (kbytes, -m) unlimited
    open files                      (-n) 1024
    pipe size            (512 bytes, -p) 8
    POSIX message queues     (bytes, -q) 819200
    real-time priority              (-r) 0
    stack size              (kbytes, -s) 10240
    cpu time               (seconds, -t) unlimited
    max user processes              (-u) 1024
    virtual memory          (kbytes, -v) unlimited
    file locks                      (-x) unlimited


open files is 1024, this is too low for hadoop.  Lets up the limit

on CENTOS:

    - edit '/etc/security/limits.conf'  
            $   sudo vi /etc/security/limits.conf
      and add the following line at the end of file
*       -       nofile  32768

what this means:
    * : all users
    - : both soft and hard limit



    - make sure '/etc/pam.d/system-auth' has this entry:
                session required pam_limits.so


     - reboot and verify the limit has taken place with a 'ulimit -n'
            $ sudo  reboot

            login to machine

            $ ulimit -a
==============

Java

Make sure java is SUN JDK 1.6 
verify by 
    $   java -version

output might look like:
    java version "1.6.0_45"
    Java(TM) SE Runtime Environment (build 1.6.0_45-b06)
    Java HotSpot(TM) 64-Bit Server VM (build 20.45-b01, mixed mode)

verify version and verify it is running 'HotSpot'

===========
