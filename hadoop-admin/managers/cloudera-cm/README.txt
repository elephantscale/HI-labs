This lab teaches the use of Cloudera Manager (CM)
----
To instructor :
    - latest guide is in : /hadoop-training/docs/Installing_Cloudera_on_Amazon.docx
      please use that

    - hosts given to students should be launched with 'Cloduera Manager' security group

== STEP 1)  Installing Cloudera Manager
 Use the instance provided by the instructor. Log in using SSH
 e.g
    ssh ec2-user@your_host_name

== STEP 2) execute the following commands on the terminal

CDH 4:
wget http://archive.cloudera.com/cm4/installer/latest/cloudera-manager-installer.bin
chmod +x cloudera-manager-installer.bin
sudo ./cloudera-manager-installer.bin

CDH5 :
wget http://archive.cloudera.com/cm5/installer/latest/cloudera-manager-installer.bin
chmod +x cloudera-manager-installer.bin
sudo ./cloudera-manager-installer.bin

(For CDH5, set swappiness to 0 on every node, like this:
# Note that this is not required if you are using hadoop-clean-V16
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

- Select the internal IPs of the servers that will go into the cluster

- Continue with the wizard

- Exploring:
    HDFS:
    click on HDFS service,  Check out Namenode WebUI

    Hue:
    Click on 'Hue' service.  Access Hue Web UI
    If prompted, create a user account with user name / password : ec2-user / ec2-user
    explore File Manager / Job Manager

(Reference: http://blog.cloudera.com/blog/2013/03/how-to-create-a-cdh-cluster-on-amazon-ec2-via-cloudera-manager/)

Create a home directory in HDFS
    sudo -u hdfs   hdfs dfs -mkdir   /user/$USER
    sudo -u hdfs  hdfs dfs -chown $USER /user/$USER
    hdfs dfs -mkdir  /user/$USER/sujee

(On ubuntu $USER = ubuntu,  On CentOS $USER = ec2-user)

for cluster health, set ntp
# Note that this is not required if you are using hadoop-clean-V16
sudo yum -y install ntp
sudo chkconfig ntpd on
sudo ntpdate 0.centos.pool.ntp.org
sudo service ntpd start

set swappiness to 0
# Note that this is not required if you are using hadoop-clean-V16
sudo bash -c "echo 'vm.swappiness = 0' >> /etc/sysctl.conf"
sudo sysctl vm.swappiness=0

