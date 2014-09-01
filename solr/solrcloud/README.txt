Installing Solr (20 min)
========================

In this lab we will install a minimal SolrCloud, with one collection 
containing two shards

Lab Goals

1. Copy a sample collection and modify it to create our version
2. Start and use SolrCloud

== STEP 1) Copy a sample collection

cd $SOLR_INSTALL/
cp -r example/ shard1/

== STEP 2) Create a core directory for logmill

  clone the collection1/ directory under shard1/solr.

== STEP 3) Delete the data directory so that you start with an empty index

== STEP 4) Remove the core.properties files for all preexisting core directories 

   that way, the cores will not be added to the SolrCloud cluster automatically. 

== STEP 5) Finally, enable core autodiscovery:

   cd shard1
   cp -r solr/collection1/ solr/logmill/
   rm -rf solr/logmill/data/
   find . -name "core.properties" -type f -exec rm {} \;
   echo "name=logmill" > solr/logmill/core.properties

== STEP 6) Start Solr in cloud mode

java -Dcollection.configName=logmill \
  -DzkRun \
  -DnumShards=2 \
  -Dbootstrap_confdir=./solr/logmill/conf \
  -jar start.jar

== STEP 7) Explain the command above


Administering Solr (20 min)
===========================
In this lab we will change the SolrCloud configuration and update SolrCloud with it

Lab Goals:

1. Change the solrconfig.xml file
2. Update SolrCloud with the changes


== STEP 1) Locate $SOLR_INSTALL/shard1/solr/logmill/conf/solrconfig.xml to

== STEP 2) Change configuration as below

<filterCache class="solr.FastLRUCache"
   size="60"
   initialSize="20"
   autowarmCount="20" />

== STEP 4) Upload changes to ZooKeeper

cd $SOLR_INSTALL/shard1/cloud-scripts
./zkcli.sh -zkhost localhost:9983
 -cmd upconfig
 -confname logmill
 -confdir ../solr/logmill/conf

(Note: in production this will be a comma-delimited list of ZooKeeper host and port pairs, or quorum)

== STEP 5)  Reload the collection

Reload the collection using the Collections API: http://localhost:8983/solr/admin/
collections?action=RELOAD&name=logmill