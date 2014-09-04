Text analysis (45 min)
========================

In this lab we will adjust the schema to implement the text analysis
techniques for tweets

Lab Goals

1. Adjust schema.xml
2. Re-index the documents
3. Verify text analysis

== STEP 1) Use the schema from conf/schema.xml in this lab's directory

The examples in this chapter depend on a few minor customizations to the schema.xml that ships with the Solr example. 
Replace the schema.xml file that ships with the Solr example found in conf/ in this lab.

$SOLR_INSTALL/example/solr/collection1/conf/schema.xml by doing cp conf/schema.xml SOLR_INSTALL/example/solr/collection1/conf/

In addition, you need to copy the wdfftypes.txt file to the conf directory:

cp conf/wdfftypes.txt $SOLR_INSTALL/example/solr/collection1/conf/

Finally, delete everything in your data directory to start with an empty search index:

rm -rf $SOLR_INSTALL/example/solr/collection1/data/*

== STEP 2) Re-index the tweet documents in data/

== STEP 3) Verify text analysis
  Select core
  Go to the "Analysis" screen
  Verify that the fields are analyzed correctly, check the indexing and the query parts.