# Hive Quick Intro

## Hive 
Classic client.
Use 
```bash
    $   hive

    hive> show tables;

```


## Beeline
New client for Hive2 Server.

```bash
    $  beeline

    -- connecting
    beeline> !connect jdbc:hive2://

    beeline> !connect jdbc:hive2://server_ip:10000


    ...

    beeline>  show tables;

    # try help
    beeline> help


```