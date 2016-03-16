# Pig Intro Lab : Join

## project dir : 
    `HI-labs/hadoop-dev/pig/join`



## STEP 1: Lab Setup

Go to the lab dir
```
  $   cd  ~/MY_NAME/HI-labs/hadoop-dev/pig/join
```

Copy `resources` file into HDFS as follows.

```
  $    hdfs dfs -put ../../../data/billing-data/resources.txt    MY_NAME/billing/

```
Note : Do not place `resources.txt` file into `billing/in` directory.  Because it has different structure than billing logs.


## STEP 2: Edit join.pig
Edit `join.pig` and complete TODO items.

## STEP 3: Run the pig file using pig:

```
  $   pig join.pig
```

## STEP 4: Inspect Join output on console
