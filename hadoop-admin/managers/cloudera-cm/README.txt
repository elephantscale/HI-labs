This lab teaches the use of Cloudera Manager (CM)
----
To instructor :
    - latest guide is in : /hadoop-training/docs/Installing_Cloudera_on_Amazon.docx
      please use that

    - hosts given to students should be launched with 'Cloduera Manager' security group

== STEP 1)  Installing Cloduera Manager
 Use the instance provided by the instructor. Log in using SSH
 e.g
    ssh ec2-user@your_host_name

== STEP 2) execute the following commands on the terminal

wget http://archive.cloudera.com/cm4/installer/latest/cloudera-manager-installer.bin
chmod +x cloudera-manager-installer.bin
sudo ./cloudera-manager-installer.bin

(For CDH5, change cm4 above to cm5 :)
wget http://archive.cloudera.com/cm5/installer/latest/cloudera-manager-installer.bin

(For CDH5, set swappiness to 0 on every node, like this:
sudo bash -c "echo 'vm.swappiness = 0' >> /etc/sysctl.conf" - then reboot
for immediate change do 'sudo sysctl vm.swappiness=0'
- because CDH5 checks it).

== STEP 3)
Follow the prompts of CDH installer on the screen.  Once the installer is done, it will ask you to login to browser based install.
In your browser to go  <your_host_name>:7180
Note : be sure to use the public IP address, rather than the private ip


== STEP 4) on the UI installer page
    Login with admin/admin.

== STEP 5) Follow the UI installer

- Welcome Page
      Select Standard License

- Page 1 :
    Click Continue

- Page 2 : Instance Specifics
    Choose 'custom image'
      Image ID : ami-e855b580  (verify with instructor)
      user : ec2-user

   instance type : m1.large  or bigger
   instances : 4
   name of cluster : <your name>-cdh


- Page 3 : Credentials
    Instructor will provide security keys
    Be sure to 'Test Credentials' to verify

    ** Important ** Choose 'Upload my own key'
    Instructor will provide SSH key (*.pem)


- Page 5 : Review to make sure every thing is right
    Click 'Start Installation'


- Page 6 : Provisioning
    nothing to do here
    Click next once done


- Page 7 : install on nodes
    click next when done


- Page 8: inspecting hosts
    click next when done

- Page 9 : starting services
    click next when done

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

for cluster health, set ntp
sudo yum -y install ntp
sudo chkconfig ntpd on
sudo ntpdate 0.centos.pool.ntp.org
sudo service ntpd start

set swappiness to 0
sudo bash -c "echo 'vm.swappiness = 0' >> /etc/sysctl.conf"
sudo sysctl vm.swappiness=0

