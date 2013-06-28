Lab : UDF

To compile all code in this directory, do

../compile.sh

To load the jar in hive shell, do

hive> add jar <jar-name>

To use the function in one of the classes in the jar, do

hive> create temporary function <your-function-name> as <path-to-implementing-class>

Exercises in the use of UDF:

Count words in 'books'
Use UDF with hi.hive.CountWords.java

Determine the users of specific browsers
Use UDF with hi.hive.GetBrowser
