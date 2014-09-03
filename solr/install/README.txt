Solr install (20 min)

In this lab we will practice the installation of the Solr server.


Lab Goals:

1. Install Solr and verify its operation
2. Prepare to use this install for all subsequent labs

== STEP 1) Verify that you have Java installed. 

The easiest way is

# yum search java | grep -i --color JDK
# yum install java-1.7.0-openjdk java-1.7.0-openjdk-devel

Alternatively, for more control you can use the Java version provided in the 'software' folder, or download the one you want.
Use this instruction for installing, cd http://wiki.centos.org/HowTos/JavaRuntimeEnvironment


== STEP 2) Download the latest Solr from here, http://lucene.apache.org/solr/. Find out the link to download, then 
use the wget or curl command to place the Solr bundle on your server, such as

wget http://mirror.cc.columbia.edu/pub/software/apache/lucene/solr/4.9.0/solr-4.9.0.tgz

Decompress and untar the bundle. You can put Solr in any directory, on Linux you can use local directory or /opr/solr

== STEP 3) Start Solr.

Assuming that $SOLR_INSTALL/ is where you put your Solr

cd $SOLR_INSTALL/example
java -jar start.jar


== STEP 4) Verify install

Open this URL in your browser: http://<your-server-url>:8983

You will be redirected to the Solr admin console

== STEP 5) Look around. Answer the following questions

1 What’s the value of the lucene-spec version property for your Solr server?
2 What’s the log level of the org.apache.solr.core.SolrConfig class?
3 What’s the value of the maxDoc property for the collection1 core?
4 What’s the value of the java.vm.vendor Java system property?
5 What’s the segment count for the collection1 core?
6 What’s the response time of pinging your server?
7 What’s the top term for the manu field? (Hint: select the manu field in the schema
browser, and click the Load Term Info button.)
8 What’s the current size of your documentCache? (Hint: think stats.)
9 What’s the analyzed value of the name Belkin Mobile Power