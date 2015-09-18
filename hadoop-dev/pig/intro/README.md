# Pig Intro Lab : learning pig concepts

## project dir : 
    `HI-labs/hadoop-dev/pig/intro`

## STEP 1: start up the GRUNT shell using pig
```
        $   pig
```
Make sure pig can connect to HDFS and MapReduce
Exit pig shell by typing    `quit;`


## STEP 2)
Edit and run the following files
- intro.pig
- filter.pig
- foreach.pig
- groupby.pig

```bash
    # edit using vi or nano
    $  vi  intro.pig  # edit & save

    # run the script
    $  pig intro.pig
```

## TIPS

**To print/echo something from pig script**
```pig
    sh echo "hello there... "
```

**To change the name of pig script supply 'job.name' parameter** 
```
    $ pig -Djob.name="hello"  script.pig
```

**Turning off logging in pig** 
```
    $   pig script.pig   2> logs
    #  all logs will be sent to logs file
```
**'echoing' execution line by line   (like sh -x)** 
```
    $   pig   < script.pig
```
