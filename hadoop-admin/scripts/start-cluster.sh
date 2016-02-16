#!/bin/bash
function usage()
{
    echo "usage : $0  -h <slave hosts file>"
    exit 1
}

hosts_file=
while getopts "h:u:i:" OPTION
do
    case $OPTION in
        h)
          hosts_file=$OPTARG
          ;;
      esac
done
shift $((OPTIND-1))

if [ -z "$hosts_file" ] ; then
    usage
fi

if [ ! -e "$hosts_file" ] ; then
    echo "hosts file '$hosts_file' not found"
    usage
fi


# start hdfs
sudo service hadoop-namenode start
./cluster-cmd.sh -h "${hosts_file}" "sudo service hadoop-datanode start"

# start mapred
sudo service hadoop-jobtracker start
./cluster-cmd.sh -h "${hosts_file}" "sudo service hadoop-tasktracker start"
