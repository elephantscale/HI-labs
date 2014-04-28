This lab teaches the use of Cloudera Manager (CM)


- Use the instance provided by the instructor. Log in.
(This instance should be launched with 'Cloduera Manager' security group)

- Install CM.
wget http://archive.cloudera.com/cm4/installer/latest/cloudera-manager-installer.bin
chmod +x cloudera-manager-installer.bin
sudo ./cloudera-manager-installer.bin

(For CDH5, change cm4 above to cm5 :)
wget http://archive.cloudera.com/cm5/installer/5.0.0-beta1.3/cloudera-manager-installer.bin

- Point the browser to <your-url>:7180.
    Login with admin/admin.

- Page 1 :
      Select Standard License

- Page 2 : Instance Specifics
      AMI :  ami-0b7c6762
      user : ec2-user
      instance type : m1.large  or bigger
      instances : 5
      name of cluster : <your name>_cdh


- Page 3 : Credentials
    Instructor will provide security keys
    Be sure to 'Test Credentials' to verify
    Let installer create new ssh keys

- Page 5 : Review to make sure every thing is right
    Click 'Start Installation'

- Page 6 : Provisioning
    nothing to do here
    Click next once done


- Page 6 :

- Start all services in the wizard, poke around the CM,
analyze how things are done. What can you accomplish with a Manager?

(Reference: http://blog.cloudera.com/blog/2013/03/how-to-create-a-cdh-cluster-on-amazon-ec2-via-cloudera-manager/)

To fix hdfs permissions
on ubuntu
    sudo -u hdfs   hdfs dfs -mkdir   /user/ubuntu
    sudo -u hdfs  hdfs dfs -chown ubuntu /user/ubuntu
    hdfs dfs -mkdir  /user/ubuntu/sujee

on centos
    sudo -u hdfs   hdfs dfs -mkdir   /user/ec2-user
    sudo -u hdfs  hdfs dfs -chown ec2-user /user/ec2-user
    hdfs dfs -mkdir  /user/ec2-user/sujee
