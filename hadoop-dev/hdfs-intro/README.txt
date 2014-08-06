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
        $ hdfs dfs -ls  /

    If you do have some data, you will see something like this
        Found 2 items
        drwxr-xr-x   - hduser supergroup          0 2013-02-19 12:00 /user
        drwxrwxrwx   - hduser supergroup          0 2013-02-19 12:00 /tmp

    Otherwise if you have no files you will see nothing.


== STEP 2) View files recursively
        $ hdfs dfs -ls -R  /

    output will be recursive listing of all files



== STEP 3) create your home directory in HDFS
        $ hdfs dfs -mkdir <your name>

    e.g
        $ hdfs dfs -mkdir tim

    This directory will be located in /user/<login_name>/<your name>


== STEP 4) Copying files to HDFS
    (make sure to complete step 3 and create your work dir in HDFS)

        $  cd HI-labs  # <--- project root dir
        $  hdfs dfs -put README.txt  <your_name>/README.txt
        $  hdfs dfs -ls  <your_name>

    output might look like:
    rwxr-xr-x   - hduser supergroup          0 2013-02-19 12:00 README.txt

    see the contents of this file from HDFS
        $  hdfs dfs -cat <yourname>/README.txt
    This should print out the file README.txt


== STEP 5) view files in UI
    option 1 -- recommended) Using Hue UI
        open Hue UI and click on 'File Manager'

    option 2) Using Namenode UI
    (Note : This step might need browser proxy setup)
    goto namenode URL   (Instructor will provide details)
    click on 'Browse File System'
    drill down to /user  directory  until you see the freshly copied file

    option 3) command line browser
        If the unable to browse the file system from your laptop, we can use
        the command line browser 'w3m'

        from cluster termainal
            $  w3m  <name node url>

        w3m key shortcuts
            - Shift B takes you back.
            - q   to quit


== STEP 6) over write files in HDFS
repeat the -put command again
        $  hdfs dfs -put README.txt  <your_name>/README.txt
what is the result?  why?

Delete the README.txt file in HDFS
Hint : To find the delete command  type 'hdfs dfs' command and see usage

Once you deleted the README.txt file, copy it again
Hint : use the -put command


== STEP 7)
    create a zero sized file under your dir
        $  hdfs dfs  -touchz  <your_name>/z

    verify the file (zero length)
        $  hdfs dfs  -ls <your_name>


== BONUS LAB 1):

    copy the files back to your local directory
        $  hdfs dfs -get <your name>/README.txt   readme2


== BONUS LAB 2)
    List all the data nodes using hdfs command
    (Find the right 'sub command' for hdfs)


== BONUS LAB 3)
    find out which machine has the blocks for a particular file
    hint the command is : fsck
        $  hdfs fsck   <full file name> [options]
    can you figure out the options?
