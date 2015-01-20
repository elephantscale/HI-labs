Installing Horton Works on Amazon
------

Instructor:
	- spin up our Hadoop image
	- m1.xlarge instances


== STEP 1) 
login to an machine instance to install ambari


== STEP 2)
execute these steps in terminal

#wget http://public-repo-1.hortonworks.com/ambari/centos6/1.x/GA/ambari.repo
#wget http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.4.3.38/ambari.repo
wget  http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.1/ambari.repo
wget http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo

sudo cp ambari.repo /etc/yum.repos.d
sudo yum install epel-release
sudo yum install -y ambari-server
sudo ambari-server setup
sudo ambari-server start

# point your browser to ambari server's hostname and port 8080
	http://your_ambar_server:8080

# login using : admin / admin 


== STEP 3) install guide
- give a name to your cluster
- select HDP 2.x
- input host names (use private IPs) 
	ssh key will be provided by instructor  (hi1.pem)
	user name : ec2-user
- for service allocation, accept the defaults
- install clients on all nodes
- password : admin for all services


== STEP 4) post instal
login to namenode

setup user hdfs directory
    $  sudo -u hdfs  hdfs  dfs -mkdir /user/$USER
    $  sudo -u hdfs  hdfs  dfs -chown $USER  /user/$USER

