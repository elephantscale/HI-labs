hdfs-intro lab

Lab Objectives:

1. Understand how to view the contents of HDFS
2. Learn how to perform basic file manipulation of your HDFS.
3. Add some files to a directory to prepare for the next exercise.


Quick Note:
'hadoop dfs'  or 'hdfs dfs' ?
for hadoop 1 and earlier versions  use 'hadoop dfs'
for hadoop 2 and later versions  use 'hdfs dfs'


== STEP 1) View Files in HDFS
    for hadoop 1
        $ hadoop dfs -ls /
    for hadoop 2
        $ hdfs dfs -ls  /

    If you do have some data, you will see something like this
        Found 2 items
        drwxr-xr-x   - hduser supergroup          0 2013-02-19 12:00 /user
        drwxrwxrwx   - hduser supergroup          0 2013-02-19 12:00 /tmp

    Otherwise if you have no files you will see nothing.


== STEP 2) View files recursively
    for hadoop 1
        $ hadoop dfs -lsr  /
    for hadopo 2
        $ hdfs dfs -ls -R  /

    output will be recursive listing of all files



== STEP 3) create your home directory in HDFS
    for hadoop 1
        $ hadoop dfs -mkdir <your name>
    for hadoop 2
        $ hdfs dfs -mkdir <your name>

    e.g
        $ hdfs dfs -mkdir tim

    This directory will be located in /user/<login_name>/<your name>


== STEP 4) Copying files to HDFS
    (make sure to complete step 3 and create your work dir in HDFS)

        $  cd HI-labs  # <--- project root dir
    for hadoop 1
        $  hadoop dfs -put README.txt  <your_name>/
        $  hadoop dfs -ls  <your_name>
    for hadoop 2
        $  hdfs dfs -put README.txt  <your_name>/
        $  hdfs dfs -ls  <your_name>

    output might look like:
    rwxr-xr-x   - hduser supergroup          0 2013-02-19 12:00 README.txt

    see the contents of this file from HDFS
    for hadoop 1
        $  hadoop dfs -cat <yourname>/README.txt
    for hadoop 2
        $  hdfs dfs -cat <yourname>/README.txt
    This should print out the file README.txt


== STEP 5)
    (Note : This step might need browser proxy setup)

    Now you can browse files in HDFS
    goto namenode URL   : http://<namenode ip>:50070
    click on 'Browse File System'
    drill down to /user  directory  until you see the freshly copied file


    If the unable to browse the file system from your laptop, we can use the command line browser 'w3m'

    from cluster termainal
        $  w3m http://<name node ip>:50070

    w3m key shortcuts
        - Shift B takes you back.
        - q   to quit


== STEP 6)
    create a simple file under your dir
        $  hdfs dfs  -touchz  <your_name>/z

    verify the file (zero length)
        $  hdfs dfs  -ls <your_name>


== BONUS LAB 1):

    copy the files back to your local directory
    for hadoop 1
        $  hadoop dfs -get <your name>/README.txt   readme2
    for hadoop 2
        $  hdfs dfs -get <your name>/README.txt   readme2


== BONUS LAB 2)
    find out which machine has the blocks for a particular file
    hint the command is : fsck
        $  hadoop fsck [options]   <full file name>
        or
        $  hdfs fsck  [options]   <full file name>
    can you figure out the options?
