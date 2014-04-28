This lab teaches the use of Cloudera Manager (CM)


- Use the instance provided by the instructor. Log in.
(This instance should be launched with 'Cloduera Manager' security group)

- Install CM.
wget http://archive.cloudera.com/cm4/installer/latest/cloudera-manager-installer.bin
chmod +x cloudera-manager-installer.bin
sudo ./cloudera-manager-installer.bin

(For CDH5, change cm4 above to cm5 :)
wget http://archive.cloudera.com/cm5/installer/latest/cloudera-manager-installer.bin

- Point the browser to <your-url>:7180.
    Login with admin/admin.

- Page 1 :
      Select Standard License

- Page 2 : Instance Specifics
      AMI : ami-6238dc0a
      user : ec2-user
      instance type : m1.large  or bigger
      instances : 5
      name of cluster : <your name>_cdh


- Page 3 : Credentials
    Instructor will provide security keys
    Be sure to 'Test Credentials' to verify

    Instructor will provide SSH keys (*.pem)
    Upload these keys to be used


- Page 5 : Review to make sure every thing is right
    Click 'Start Installation'


- Page 6 : Provisioning
    nothing to do here
    Click next once done


- Page 7 :
    start all services


- Install Done:
    congrats.. cluster is up and running


- Exploring:
    HDFS:
    click on HDFS service,  Check out Namenode WebUI

    Hue:
    Click on 'Hue' service.  Access Hue Web UI
    If prompted, create a user account with user name / password : ec2-user / ec2-user
    explore File Manager / Job Manager

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
