HI-labs
=======

Labs:
-----
* mr-billing: calculates customer total
* mr-billing-itemized : itemized bill
* mr-counters : counter example
* mr-distcache-jars : using external jar files
* mr-billing-polished : 'hardened' mr billing
* mr-combiner : combiner lab
* mr-distcache-lookup : Using Distributed cache for lookup data


Importing Into Eclipse:
----------------------
STEP 1)
Each of the labs is an eclipse project.
To import them into Eclipse
    Eclipse --> Import Project --> General --> Existing Projects into Workspace,
 then select the project dir
To import all projects in bulk, select the 'root dir'

STEP 2)
Create a Java Classpath variable
    Window --> Preferences --> Java --> Build Path --> Classpath Variables
create a new variable
    HADOOP_JARS = point it to 'HI-labs/lib' folder


Creating New Projects (Internal):
---------------------
$ cp -a mr-billing  mr-new
$ vi mr-new/.project
    edit project name
        <projectDescription>
            <name>mr-billing</name>

In Eclipse, choose 'Import Project'.  Select the newly created project
