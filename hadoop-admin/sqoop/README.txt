This lab teaches the use of Sqoop
----
To instructor :
    - each student can install sqoop on his node in the cluster. Alternatively, they can work in groups, so that each group has a node assigned to it
    - each student can work in his own copy of the directory, generating data under his or her name

== STEP 1)  Installing MySQL (if it is not installed)
 
  yum install mysql-server mysql php-mysql  
  chkconfig --levels 235 mysqld on #Set the MySQL service to start on boot
  service mysqld start #Start the MySQL service
  mysql -u root #Log into MySQL
  exit #Exit MySQL
  
   1006  sudo yum install mysql-server
 1007  sudo /sbin/service mysqld start

== STEP 2) Load the log data into the table
  generate the data using the scripts in data HI_labs/data/scripts (unless you did it before)
  
  Login to the database
  mysql -u root
  Create the database
  create database training  
  use training

  create the table, based on the data you will be using (see below), such as
  CREATE TABLE mylogs (message_type VARCHAR(20), m1 VARCHAR(20), m2 VARCHAR(20), m3 VARCHAR(20), m4 VARCHAR(20), m5 VARCHAR(20))

  Use the statement similar to 
  load data local infile '0.log' into table mylogs fields terminated by ' '
  enclosed by '"'
  lines terminated by '\n'
  (message_type, m1, m2, m3, m4, m5)

== STEP 3) Installing sqoop
  sqoop should be installed, if not - 'sudo yum install --assumeyes sqoop'
  sudo ln -s ~/HI-labs/hadoop-dev/lib/mysql-connector-java-5.1.31-bin.jar mysql-connector-java.jar #give it mysql connector (adjust the path if needed): 

== STEP 4) Operate sqoop
  sqoop help
  sqoop list-databases --connect jdbc:mysql://localhost --username root --password <password> # if using password
  sqoop list-tables --connect jdbc:mysql://localhost/training --username root --password <password> # if using password
  sqoop import --connect jdbc:mysql://localhost/training --table mylogs --fields-terminated-by '\t'  --username root --password <password> # if using password

== STEP 5) Verify that the command worked
  hdfs dfs -ls mylogs
  hdfs dfs -tail mylogs/part-m-00000

Bonus points

  Create and import the database containing emails from Enron litigation, http://freeeed.org/index.php/documentation/testing-with-enron-data
  
