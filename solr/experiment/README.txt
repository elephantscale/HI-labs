Adapting 'Example' for your future experiments (20 min)

In this lab we will create our own Solr application

Lab Goals:

1. Starting from 'example', create a framework for your own application
2. Clean and adjust the new created app

Say we want to create an Solr app called 'realestate'

== STEP 1) Create a deep copy of the example/ directory; for example, cp -R example realestate.

== STEP 2) lean up the cloned directory to remove unused Solr home directories, such as example-DIH/ and multicore/

== STEP 3) Under the Solr home directory, rename collection1/ to something more intuitive for your application, such as 'house_listing'

== STEP 4)  Update core.properties to point to the name of your new collection by replacing collection1 with the name of your core from step 3; such as: name
=house_listing.