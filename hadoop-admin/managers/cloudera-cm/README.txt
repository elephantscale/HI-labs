This lab teaches the use of Cloudera Manager (CM)


- Use the instance provided by the instructor. Log in.
(This instance should be launched with 'Cloduera Manager' security group)

- Install CM.
wget http://archive.cloudera.com/cm4/installer/latest/cloudera-manager-installer.bin
chmod +x cloudera-manager-installer.bin
sudo ./cloudera-manager-installer.bin

(For CDH5, change cm4 above to cm5 :)

- Point the browser to <your-url>:7180. Login with admin/admin. 

- Select Standard License

- AMI : ami-5f723836
  user : ec2-user
  instance type : m1.large  or bigger
  instances : 5
  name of cluster : <your name>_cdh

- Instructor will provide security keys
  Let installer create new keys

- Install 4 additional nodes for the cluster.

- Start all services in the wizard, poke around the CM,
analyze how things are done. What can you accomplish with a Manager?

(Reference: http://blog.cloudera.com/blog/2013/03/how-to-create-a-cdh-cluster-on-amazon-ec2-via-cloudera-manager/)

To fix hdfs permissions
sudo -u hdfs   hdfs dfs -mkdir   /user/ubuntu
sudo -u hdfs  hdfs dfs -chown ubuntu /user/ubuntu
hdfs dfs -mkdir  /user/ubuntu/sujee
