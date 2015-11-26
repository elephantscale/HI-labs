# hdfs-intro lab

## Lab Objectives:
- Understand how to view the contents of HDFS
- Learn how to perform basic file manipulation of your HDFS.
- Add some files to a directory to prepare for the next exercise.

**Quick Note:**  
`hadoop dfs`  or `hdfs dfs` ?  
for hadoop 1 and earlier versions  use `hadoop dfs`  
for hadoop 2 and later versions  use `hdfs dfs`


**HDFS commands cheat sheet :**  
http://www.dummies.com/how-to/content/hadoop-for-dummies-cheat-sheet.html

## STEP 1) View HDFS files in the browser UI

- option 1) Go to Namenode UI and launch the file browser
(look under Utilities menu )

- option 2) Use Hue file browser

**=> Navigate to    `/user/<login name>`  directory in HDFS** 
**=> Q : What files do you see?**  
**=> Q : How about all the personal workspace files we created in 'getting started' lab?** 

### Break : Instructor to explain the missing files ###


## STEP 2) Use command line utility view files in HDFS

Hint : To find usage of a hadoop command, just type the command in terminal.  It will print out the usage:
```bash
    $   hdfs 
    $   hdfs dfs
```

**=> Ok, let's list the files in HDFS root directory.** 

```bash
    $   hdfs dfs -ls  /
```

If you do have some data, you will see something like this
```console
    Found 2 items
    drwxr-xr-x   - hduser supergroup          0 2013-02-19 12:00 /user
    drwxrwxrwx   - hduser supergroup          0 2013-02-19 12:00 /tmp
```
Otherwise if you have no files you will see nothing.


## STEP 3) View files recursively
```bash
        $   hdfs dfs -ls -R  /
```
Output will be recursive listing of all files


## STEP 4) Create your home directory in HDFS
Replace MY_NAME with your name
```
        $   hdfs dfs -mkdir MY_NAME
e.g     $   hdfs dfs -mkdir tim
```

This directory will be located in `/user/<login_name>/MY_NAME`


## STEP 5) Copying files to HDFS
Make sure to complete step 3 and create your work dir in HDFS.  
Replace MY_NAME with yours
```bash
    $   hdfs dfs -put ~/README.txt  MY_NAME/README.txt
    $   hdfs dfs -ls  MY_NAME
```

output might look like:
```console
rwxr-xr-x   - hduser supergroup          0 2013-02-19 12:00 README.txt
```

See the contents of this file from HDFS.
Replace MY_NAME with yours
```bash
    $   hdfs dfs -cat   MY_NAME/README.txt
```
This should print out the file README.txt


## STEP 6) View the created files in Browser UI  (refer to STEP 1)
Go ahead and click  on a file in the UI.  What do you see?


## STEP 7) Over write files in HDFS
Repeat the -put command again.  
Replace MY_NAME with yours.
```bash
        $  hdfs dfs -put   ~/README.txt   MY_NAME/README.txt
```
What is the result?  why?

**=> Q :  How can we over-write the file?**  
    You have to delete it and re-create it

**=> Delete the README.txt file in HDFS**  
Hint : To find the delete command  type `hdfs dfs` command and see usage

Once you deleted the README.txt file, copy it again.  
Hint : use the `-put` command


## STEP 8) Create a zero sized file 
Replace MY_NAME with yours.
```bash
    $  hdfs dfs  -touchz  MY_NAME/z
```

Verify the file has zero length. Replace MY_NAME with yours.
```
    $  hdfs dfs  -ls MY_NAME
```

**=> Q : How many blocks does file `z` have? **  


## BONUS LAB 1: Get files out of HDFS
Copy the files back to your local directory.  
Replace MY_NAME with yours.
```
        $  hdfs dfs -get   MY_NAME/README.txt     readme2
```


## BONUS LAB 2: List all the data nodes using hdfs command.
Hint 1:  Find the right 'sub command' for hdfs.  
Hint 2 : you may lack permissions.  Try the command with:
```
    sudo -u hdfs   the-command
```

## BONUS LAB 3: Block locations
Find out which machine has the blocks for a particular file.  
Hint `fsck`  
```
        $  hdfs fsck   <full file name> [options]
```
Can you figure out the options?  
HINT: You probably need to do this as the `hdfs` user.

