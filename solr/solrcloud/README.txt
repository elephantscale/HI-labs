Administering Solr (20 min)

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