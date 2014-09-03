Solr indexing and searching (15 min) - example documents
====================================

In this lab we will practice the direct indexing of documents with Solr server and searching in them.


Lab Goals:


1. Index example documents
2. Search the results

== STEP 0) Clean up the index (brute force, we will learn a more sophisticated way at the end of this lab)

After stopping Solr, you can remove all documents by deleting the contents of the data/ directory for your core, such as solr/collection1/data/*. When you restart Solr, you’ll have a fresh index with 0 documents.

== STEP 1) Index documents

cd $SOLR_INSTALL/example/exampledocs
java -jar <path-to-solr-jar>/post.jar *.xml


== STEP 2) Execute the *:* query. For that, select 'collection1'. Follow the screenshot on the slides.

== STEP 3) Investigate various search options provided by Solr. Compose yourlist, then compare it to the screenshot on the slides.


Solr indexing and searching for tweets - XML and JSON ((15 min)
==============================================================

In this lab we will practice the indexing of XML and JSON tweet documents.
The documents are found in this labs's data folder. 


Lab Goals:

1. Index tweet documents
2. Search the results

== STEP 1) Index XML documents

cd $HI_Labs/solr/indexing/data
java -jar <path-to-post-jar>/post.jar tweets.xml

== STEP 2) Execute the *:* query. 

click Query under collection1 in the menu on the left, and execute query
type_s:post

== STEP 3) Index JSON documents

java -Dtype=application/json -jar post.jar tweets.json

Notice:
------
We use dynamic fields. For instance, screen_name_s will is a string because
of the _s suffix on the name.

Question: do we have 4 documents in the index now? We indexed 2 documents 2 times! If not, explain why not.


Solr document deletion (15 min)
====================================

In this lab we will practice various ways of deleting documents from the Solr index.


Lab Goals:

1. Delete specific document by ID
2. Delete all documents

== STEP 1) Index documents as above. Use either example documents or tweets.

== STEP 2) To delete a document by ID

Use the following query form

<delete>
  <id>1</id>
</delete>

With the update below 

curl http://localhost:8983/solr/update

== STEP 3) To delete all documents

curl http://localhost:8983/solr/update --data '<delete><query>*:*</query></delete>' -H 'Content-type:text/xml; charset=utf-8'
curl http://localhost:8983/solr/update --data '<commit/>' -H 'Content-type:text/xml; charset=utf-8'

