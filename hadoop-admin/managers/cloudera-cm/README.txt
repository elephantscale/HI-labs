This lab teaches the use of Cloudera Manager (CM)

1. Use the instance provided by the instructor. Log in.

2. Install CM.

wget http://archive.cloudera.com/cm4/installer/latest/cloudera-manager-installer.bin
chmod +x cloudera-manager-installer.bin
sudo ./cloudera-manager-installer.bin

3. Point the browser to <your-url>:7180. Login with admin/admin. 

4. Install 4 additional nodes for the cluster.

5. Start all services in the wizard, poke around the CM,
analyze how things are done. What can you accomplish with a Manager?

(Reference: http://blog.cloudera.com/blog/2013/03/how-to-create-a-cdh-cluster-on-amazon-ec2-via-cloudera-manager/)

To fix hdfs permissions

sudo -u hdfs   hdfs dfs -mkdir   /user/ubuntu

sudo -u hdfs  hdfs dfs -chown ubuntu /user/ubuntu

hdfs dfs -mkdir  /user/ubuntu/sujee
