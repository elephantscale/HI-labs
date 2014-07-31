Lab : Using HCatalog
location : hadoop-dev/hcatalog

pre-requisites for this lab:
	1) you should have billing data in  <your name>/billing/in  directory
	2) hadoop-dev/pig/billing
	3) hadoop-dev/hive/billing



== STEP 1) hcat command
Use 'hcat' CLI to list all tables in the system.
Hint : use -e option to hcat command and 'list' keyword

Use hcat command to look at the table schema.
Hint : -e option with  'describe' keyword


== STEP 2) can you see the data in the table using hcat command?
Hint : use -e option with 'select ....' keyword


== STEP 3) using HCatalog with Pig
Edit file  : hcat.pig
Fix TODO-1
Run the script
	$   pig hcat.pig
What is the result?

provide '-useHCatalog' option to pig and run it again
	$   pig -useHCatalog  hcat.pig

what is the run result?
How does Pig know about the schema of Hive table?


Edit file hcat.pig
Fix the TODO items
Execute the script
    $   pig   hcat.pig

Note :
    - we are not specifying schema (comes from HCat)
    - we are not specifying data location (comes from HCat)

=====
hcat -e 'show tables;'
hcat -e 'describe  <table name>;'

create billing table in hive
create invoice table using Hcat*

pig -useHCatalog  hcat.pig

overriding partitions
https://issues.apache.org/jira/browse/HCATALOG-551
https://cwiki.apache.org/confluence/display/Hive/HCatalog+LoadStore#HCatalogLoadStore-HCatStorer 