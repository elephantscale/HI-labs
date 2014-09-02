Relevancy tuning (45 min)
========================

In this lab we will adjust the schema to implement the text analysis
techniques for tweets

Lab Goals

1. Adjust schema.xml
2. Re-index the documents
3. Verify text analysis

== STEP 1) Use the schema from conf/schema.xml in this lab's directory

The examples in this chapter depend on a few minor customizations to the
schema.xml that ships with the Solr example. We recommend that you replace the
schema.xml file that ships with the Solr example with the customized version in
$SOLR_IN_ACTION/example-docs/ch6/schema.xml. Specifically, you need to overwrite
$SOLR_INSTALL/example/solr/collection1/conf/schema.xml by doing
cp $SOLR_IN_ACTION/example-docs/ch6/schema.xml SOLR_INSTALL/example/solr/collection1/conf/

In addition, you need to copy the wdfftypes.txt file to the conf directory:
cp $SOLR_IN_ACTION/example-docs/ch6/wdfftypes.txt $SOLR_INSTALL/example/solr/collection1/conf/

Finally, to start with a clean slate, you should delete everything in your data directory to start with an empty search index:

rm -rf $SOLR_INSTALL/example/solr/collection1/data/*